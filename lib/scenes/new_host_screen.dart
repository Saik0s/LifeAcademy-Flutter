import 'package:flutter/material.dart';

class NewHostScreen extends StatefulWidget {
  @override
  _NewHostScreenState createState() => new _NewHostScreenState();
}

class _NewHostScreenState extends State<NewHostScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  _onSubmit(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Создание игры'),
      ),
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
                    icon: const Icon(Icons.people),
                    hintText: 'Сколько игроков будет играть',
                    labelText: 'Количество игроков',
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (String value) {
                    // person.email = value;
                  },
                ),
                const SizedBox(height: 24.0),
                new Center(
                  child: new RaisedButton(
                    child: new Text('Создать'),
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
