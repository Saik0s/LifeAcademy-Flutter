import 'package:flutter/material.dart';
import 'package:life_academy/scenes/new_host_screen.dart';
import 'package:life_academy/scenes/profile_screen.dart';

class SelectTypeScreen extends StatefulWidget {
  @override
  _SelectTypeScreenState createState() => new _SelectTypeScreenState();
}

class _SelectTypeScreenState extends State<SelectTypeScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  _onPlayerSelect(BuildContext context) {
        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new ProfileScreen();
    }));
  }
  _onHostSelect(BuildContext context) {
        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new NewHostScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: AppBar(
        // title: new Text('Подключение к игре'),
      // ),
      body: new Center(
        child: new Form(
          key: _formKey,
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Image(
                    image: new AssetImage('resources/images/logo.png'),
                    height: 100.0),
                new RaisedButton(
                  color: Colors.green,
                  child: new Text('Я игрок'),
                  onPressed: () => _onPlayerSelect(context),
                ),
                const SizedBox(height: 24.0),
                new RaisedButton(
                  child: new Text('Я хост'),
                  onPressed: () => _onHostSelect(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
