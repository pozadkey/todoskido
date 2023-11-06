import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),

  // Cupertino theme
  cupertinoOverrideTheme: CupertinoThemeData(
    barBackgroundColor: Colors.black,
    primaryColor: Colors.white,
    textTheme:
        CupertinoTextThemeData(textStyle: TextStyle(color: Colors.grey[100])),
  ),

  // Bottom nav bar theme
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black, elevation: 0),

  // Material App theme
  colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.grey[900]!,
      secondary: Colors.grey[800]!),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.black)),

  // Text Theme
  textTheme: const TextTheme(
    // Header text style
    displayLarge: TextStyle(
        fontSize: 96,
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'ClashDisplay',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2),
// Header text style mobile
    headlineMedium: TextStyle(
        fontSize: 58,
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'ClashDisplay',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2),

    // Medium text style
    displayMedium: TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 239, 239, 239),
        fontFamily: 'SpaceGrotesk',
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.2),

    // default text style
    displaySmall: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontFamily: 'SpaceGrotesk',
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.2),

    titleSmall: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontFamily: 'SpaceGrotesk',
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.2),

    titleMedium: TextStyle(
        fontSize: 32,
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'ClashDisplay',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2),
  ),
);

// ListTile Colors
class ListTileColor {
  static Color bgColor = Colors.black;  // Background Color
  static Color checkBoxColor = Colors.white; // CheckBox Color
}
