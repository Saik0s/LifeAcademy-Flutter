import 'package:flutter/material.dart';

class AdulthoodScreen extends StatefulWidget {
  @override
  _AdulthoodScreenState createState() => new _AdulthoodScreenState();
}

class _AdulthoodScreenState extends State<AdulthoodScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  _onSubmit(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: AppBar(
//        title: new Text('Создание игры'),
//      ),
      body: new Center(
        child: new Form(
          key: _formKey,
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.cloud),
                    hintText: 'Какая у тебя мечта?',
                    labelText: 'Твоя мечта',
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (String value) {
                    // person.email = value;
                  },
                ),
                const SizedBox(height: 24.0),
                new Center(
                  child: new RaisedButton(
                    child: new Text('Сохранить'),
                    onPressed: () => _onSubmit(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
