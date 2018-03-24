import 'package:flutter/material.dart';
import 'package:life_academy/scenes/join_screen.dart';
import 'package:life_academy/data/person_data.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => new _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PersonData person = new PersonData();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  _onNext(BuildContext context) {
    final FormState form = _formKey.currentState;
    form.save();
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new JoinScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text(widget.header),
      // ),
      body: new Center(
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
                    icon: const Icon(Icons.person),
                    hintText: 'Как тебя зовут?',
                    labelText: 'Имя',
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    person.name = value;
                  },
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.cake),
                    hintText: 'Сколько тебе лет?',
                    labelText: 'Возраст',
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (String value) {
                    person.age = value;
                  },
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person_pin),
                    hintText: 'Как зовут твоего родителя(волонтера)',
                    labelText: 'Имя родителя(волонтера)',
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    person.parentName = value;
                  },
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Сколько лет родителю(волонтеру)?',
                    labelText: 'Возраст родителя(волонтера)',
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (String value) {
                    person.parentAge = value;
                  },
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Какой твой номер телефона?',
                    labelText: 'Телефон',
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (String value) {
                    person.phone = value;
                  },
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Какой твой адрес электронной почты?',
                    labelText: 'Электронная почта',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String value) {
                    person.email = value;
                  },
                ),
                const SizedBox(height: 24.0),
                new Center(
                  child: new RaisedButton(
                    child: new Text('Далее'),
                    onPressed: () => _onNext(context),
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
