import 'package:flutter/material.dart';
import 'tabs/adulthood_screen.dart';
import 'tabs/childhood_screen.dart';
import 'tabs/dreams_screen.dart';
import 'tabs/life_picture_screen.dart';
import 'tabs/oldness_screen.dart';
import 'tabs/youth_screen.dart';

class NavigationIconView {
  NavigationIconView({
    Widget screen,
    Widget icon,
    String title,
    Color color,
    TickerProvider vsync,
  })  : _screen = screen,
        _icon = icon,
        _color = color,
        _title = title,
        item = new BottomNavigationBarItem(
          icon: icon,
          title: new Text(title),
          backgroundColor: color,
        ),
        controller = new AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = new CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  final Widget _screen;
  final Widget _icon;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  CurvedAnimation _animation;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    Color iconColor;
    if (type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      final ThemeData themeData = Theme.of(context);
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }

    return new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(0.0, 0.02), // Slightly down.
          end: Offset.zero,
        ).animate(_animation),
        child:
          new Semantics(
            label: '$_title tab',
            child: _screen,
          )
//        new IconTheme(
//          data: new IconThemeData(
//            color: iconColor,
//            size: 120.0,
//          ),
//          child: new Semantics(
//            label: 'Placeholder for $_title tab',
//            child: _icon,
//          ),
//        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        screen: new DreamsScreen(),
        icon: const Icon(Icons.cloud),
        title: 'Мечты',
        color: Colors.deepPurple,
        vsync: this,
      ),
      new NavigationIconView(
        screen: new ChildhoodScreen(),
        icon: const Icon(Icons.child_care),
        title: 'Детство',
        color: Colors.deepOrange,
        vsync: this,
      ),
      new NavigationIconView(
        screen: new YouthScreen(),
        icon: const Icon(Icons.school),
        title: 'Юнность',
        color: Colors.teal,
        vsync: this,
      ),
      new NavigationIconView(
        screen: new AdulthoodScreen(),
        icon: const Icon(Icons.work),
        title: 'Зреллость',
        color: Colors.indigo,
        vsync: this,
      ),
      new NavigationIconView(
        screen: new OldnessScreen(),
        icon: const Icon(Icons.people),
        title: 'Старость',
        color: Colors.pink,
        vsync: this,
      ),
      new NavigationIconView(
        screen: new LifePictureScreen(),
        icon: const Icon(Icons.map),
        title: 'Жизнь',
        color: Colors.lightBlue,
        vsync: this,
      )
    ];

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);

    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews) view.controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }

  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[];

    for (NavigationIconView view in _navigationViews)
      transitions
          .add(view.transition(BottomNavigationBarType.shifting, context));

    // We want to have the newly animating (fading in) views on top.
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });

    return new Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.shifting,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );

    return new Scaffold(
      body: new Center(child: _buildTransitionsStack()),
      bottomNavigationBar: botNavBar,
    );
  }
}
