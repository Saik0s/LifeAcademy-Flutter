import 'package:flutter/material.dart';
import 'package:life_academy/theme.dart';
import 'package:life_academy/scenes/select_type_screen.dart';

class LifeAcademyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Life Academy',
      theme: LifeAcademyTheme.theme,
      home: new SelectTypeScreen(),
    );
  }
}
