import 'package:pokemon/values/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    labelStyle: TextStyle(
      color: AppColors.gray,
    ),
    floatingLabelStyle: TextStyle(
      color: AppColors.colorPrimary,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: AppColors.colorPrimary,
      ),
    ),
  );

  static final TextSelectionThemeData _textSelectionThemeData =
      TextSelectionThemeData(cursorColor: AppColors.colorPrimary);

  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.colorPrimaryDark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.colorPrimary),
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white, opacity: 1),
      scaffoldBackgroundColor: Colors.grey.shade900,
      inputDecorationTheme: _inputDecorationTheme,
      textSelectionTheme: _textSelectionThemeData);

  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.colorPrimary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.colorPrimary),
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: AppColors.colorPrimary, opacity: 1),
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: _inputDecorationTheme,
      textSelectionTheme: _textSelectionThemeData);
}