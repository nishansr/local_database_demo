import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class MyThemePreferences {
  static const THEME_KEY = "theme_key";

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(THEME_KEY, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(THEME_KEY) ?? false;
  }
}

final lightTheme = ThemeData(
  primaryColor: Colors.blue,
  hintColor: Colors.green,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.indigo,
  hintColor: Colors.teal,
  scaffoldBackgroundColor: Colors.grey[900],
  appBarTheme: const AppBarTheme(
    color: Colors.indigo,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
  ),
);

