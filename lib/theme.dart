import 'package:flutter/material.dart';

const Color lightBackgroundColor = Colors.white;
Color lightSurfaceColor = Colors.grey.shade100;
const Color lightPrimaryColor = Colors.blue;
const Color lightAccentColor = Colors.lightBlue;
const Color lightTextColor = Colors.black;

const Color darkBackgroundColor = Colors.black;
Color darkSurfaceColor = Colors.grey.shade800;
const Color darkPrimaryColor = Colors.white;
const Color darkAccentColor = Colors.teal;
const Color darkTextColor = Colors.white;

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(background: lightBackgroundColor),
  scaffoldBackgroundColor: lightSurfaceColor,
  primaryColor: lightPrimaryColor,
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: lightTextColor),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(background: darkBackgroundColor),
  scaffoldBackgroundColor: darkSurfaceColor,
  primaryColor: darkPrimaryColor,
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: darkTextColor),
  ),
);
