import 'package:flutter/material.dart';

class ChildhoodScreen extends StatefulWidget {
  @override
  _ChildhoodScreenState createState() => new _ChildhoodScreenState();
}

class _ChildhoodScreenState extends State<ChildhoodScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  _onSubmit(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        body: new NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context),
                  child: new SliverAppBar(
                    title: const Text('Tabs'),
                    pinned: true,
                    expandedHeight: 150.0,
                    forceElevated: innerBoxIsScrolled,
                    bottom: new TabBar(
                        tabs: <Tab>[
                          new Tab(text: '1',),
                          new Tab(text: '2',),
                          new Tab(text: '3',)
                        ].toList()),
                  ),
                )
              ];
            },
            body: new TabBarView(
                children: <String>['1', '2', '3'].map((String lbl) {
                  return new SafeArea(
                    child: new SingleChildScrollView(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Center(
                              child: new Image(
                                  image: new AssetImage(
                                      'resources/images/logo.png'),
                                  height: 100.0
                              )
                          )
                        ],
                      ),
                    ),
                  );
                }).toList()
            )
        ),
      ),
    );
//    return new Scaffold(
////      appBar: AppBar(
////        title: new Text('Создание игры'),
////      ),
//      body: new Center(
//        child: new Form(
//          key: _formKey,
//          child: new SingleChildScrollView(
//            padding: const EdgeInsets.symmetric(horizontal: 16.0),
//            child: new Column(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: <Widget>[
//                new TextFormField(
//                  decoration: const InputDecoration(
//                    icon: const Icon(Icons.cloud),
//                    hintText: 'Какая у тебя мечта?',
//                    labelText: 'Твоя мечта',
//                  ),
//                  keyboardType: TextInputType.number,
//                  onSaved: (String value) {
//                    // person.email = value;
//                  },
//                ),
//                const SizedBox(height: 24.0),
//                new Center(
//                  child: new RaisedButton(
//                    child: new Text('Сохранить'),
//                    onPressed: () => _onSubmit(context),
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
  }
}
