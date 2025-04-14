import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService {
  static ThemeData get lightTheme => ThemeData(
    primaryColor: Color(0xff0090ac),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Color(0xff0090ac),
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.copyWith(
      bodyMedium: const TextStyle(fontFamily: 'Poppins'),
    ),
  );
}
