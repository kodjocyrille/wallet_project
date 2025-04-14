import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService {
  static ThemeData get lightTheme => ThemeData(
    primaryColor: Color(0xff0090ac),
    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: Colors.blue,
    //   accentColor: Color(0xff0090ac),
    // ).copyWith(
    //   secondary: Color(0xff0090ac),
    // ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff0090ac),
      onPrimary: Color(0xff0090ac),
      secondary: Color(0xff07c1d5),
      onSecondary: Color(0xff07c1d5),
      error: Colors.red,
      onError: Colors.red,
      surface: Colors.black,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        // color: Color(0xff004856),
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.copyWith(
      bodyMedium: const TextStyle(fontFamily: 'Poppins'),
    ),
  );
}
