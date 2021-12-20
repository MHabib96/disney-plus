import 'package:flutter/material.dart';

enum AppTheme { Default }

final appThemes = {
  AppTheme.Default: ThemeData(
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.white),
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(54, 69, 79, 0.2),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.blueGrey,
      backgroundColor: Color.fromRGBO(54, 69, 79, 0.3),
    ),
  ),
};
