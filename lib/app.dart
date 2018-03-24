import 'package:flutter/material.dart';
import 'package:life_academy/theme.dart';
import 'package:life_academy/scenes/home_screen.dart';

class LifeAcademyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: LifeAcademyTheme.theme,
      home: new MyHomePage(header: 'Flutter Demo Home Page'),
    );
  }
}

class PersonData {
  String name = '';
  String age = '';
  String parentName = '';
  String parentAge = '';
  String phone = '';
  String email = '';
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.header}) : super(key: key);

  final String header;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PersonData person = new PersonData();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  _onNext() {
    final FormState form = _formKey.currentState;
    form.save();
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new HomeScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text(widget.header),
      // ),
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
            key: _formKey,
            child: new SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Image(
                      image: new AssetImage('resources/images/logo.png'),
                      height: 100.0),
                  new TextFormField(
                    decoration: const InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: const Icon(Icons.person),
                      hintText: 'Как тебя зовут?',
                      labelText: 'Имя',
                    ),
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(labelText: "Возраст"),
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                        labelText: "Имя родителя(волонтера)"),
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                        labelText: "Возраст родителя(волонтера)"),
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(labelText: "Телефон"),
                  ),
                  new TextFormField(
                    decoration:
                        new InputDecoration(labelText: "Электронная почта"),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      person.email = value;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  new Center(
                    child: new RaisedButton(
                      child: new Text('Далее'),
                      onPressed: _onNext,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
