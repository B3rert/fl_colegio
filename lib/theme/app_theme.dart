import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff75099e);
  static const Color backgroundCololorDark = Color(0xff1f212c);
  static const Color secondaryColorDark = Color(0xff676262);
  static const Color secondBackgroundColorDark =
      Color.fromRGBO(45, 49, 65, 255);

//Tema oscuro
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: backgroundCololorDark,
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: backgroundCololorDark,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: primary,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primary,
        elevation: 0,
        shape: const StadiumBorder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(
        color: primary,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primary),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primary),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        //borderSide: const BorderSide(color: primary),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
