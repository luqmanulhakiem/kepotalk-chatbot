import 'package:flutter/material.dart';
import 'package:kepotalk/src/core/theme/app_font.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(Colors.white),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        backgroundColor: WidgetStatePropertyAll(Color(0xFF64B5F6)),
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: AppFont.generalSansSerif.copyWith(color: Colors.black),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          AppFont.generalSansSerif.copyWith(color: Colors.black),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF64B5F6)),
        borderRadius: BorderRadius.circular(20),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFF44336)),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF64B5F6)),
        borderRadius: BorderRadius.circular(20),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF9E9E9E)),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(Colors.black),
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        backgroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.black),
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: AppFont.generalSansSerif.copyWith(color: Colors.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          AppFont.generalSansSerif.copyWith(color: Colors.white),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFF44336)),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF9E9E9E)),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
