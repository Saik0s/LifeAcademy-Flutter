import 'package:flutter/material.dart';

class LifeAcademyTheme {
  static get theme {
    final originalTextTheme = new ThemeData.dark().textTheme;
    final originalBody1 = originalTextTheme.body1;

    return new ThemeData.light().copyWith(
        primaryColor: Colors.grey[800],
        accentColor: Colors.cyan[300],
        buttonColor: Colors.grey[800],
        textSelectionColor: Colors.cyan[100],
        backgroundColor: Colors.grey[800],
        textTheme: originalTextTheme.copyWith(
            body1:
                originalBody1.copyWith(decorationColor: Colors.transparent)));
  }
}
