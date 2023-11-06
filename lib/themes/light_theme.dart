import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),

  // Cupertino theme
  cupertinoOverrideTheme: CupertinoThemeData(
    barBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    textTheme:
        CupertinoTextThemeData(textStyle: TextStyle(color: Colors.grey[900])),
  ),

  // Bottom nav bar theme
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white, elevation: 0),

  // Material App theme
  colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.grey[200]!,
      secondary: Colors.grey[100]!),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.white)),

  // Text Theme
  textTheme: TextTheme(
    // Header text style
    displayLarge: TextStyle(
        color: Colors.grey[800]!,
        fontFamily: 'ClashDisplay',
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2),
// Header text style mobile
    headlineMedium: const TextStyle(
        fontSize: 58,
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'ClashDisplay',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2),

    // Medium text style
    displayMedium: const TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 239, 239, 239),
        fontFamily: 'SpaceGrotesk',
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.2),

    // default text style
    displaySmall: TextStyle(
        fontSize: 16,
        color: Colors.grey[800]!,
        fontFamily: 'ClashDisplay',
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.2),

    titleSmall: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontFamily: 'SpaceGrotesk',
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.2),

    titleMedium: const TextStyle(
        fontSize: 32,
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'ClashDisplay',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2),
  ),
);

// ListTile Colors
class ListTileColor {
  static Color bgColor = Colors.grey[200]!; // Background Color
  static Color checkBoxColor = Colors.grey[800]!; // Background Color
}

// DialogBox Colors
class DialogBoxColor {
  static Color bgColor = Colors.grey[600]!; // Background Color
  static Color checkBoxColor = Colors.grey[800]!; // Background Color
}

// TextField Colors
class TextFieldColor {
  static Color filledColor =
      const Color.fromARGB(255, 255, 255, 255); // Filled Color
  static Color hintTextColor = Colors.grey[400]!; // hint Color
   static Color inputTextColor = Colors.grey[800]!; // hint Color
}

// Primary Button Colors
class PrimaryButtonColors {
  static Color bgColor = Colors.grey[800]!; // Background color
  static Color textColor = Colors.white; // Text color
}

// Alert Box Colors
class AlertBoxColors {
  static Color bgColor =
      const Color.fromARGB(255, 32, 32, 32); // Background color
}
