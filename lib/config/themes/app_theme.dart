import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData appTheme = ThemeData(
  primarySwatch: Colors.grey,
  canvasColor: ATHENS_GRAY,
  // visualDensity: VisualDensity.adaptivePlatformDensity,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: IconThemeData(opacity: 1.0, size: 30),
    unselectedIconTheme: IconThemeData(opacity: 0.3, size: 30),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  ),

  textTheme: TextTheme(
    button: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w900,
    ),
    headline3: TextStyle(
      fontSize: 24,
    ),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    isDense: true,
    hintStyle: TextStyle(
      color: Colors.white,
    ),
  ),

  appBarTheme: AppBarTheme(
    brightness: Brightness.dark,
    iconTheme: IconThemeData(
      color: ATHENS_GRAY,
      size: 24,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        color: GRAY_CHATEAU[500],
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: GRAY_CHATEAU[50],
        fontSize: 24,
        fontWeight: FontWeight.w900,
      ),
    ),
  ),
  iconTheme: IconThemeData(
    color: GRAY_CHATEAU,
    // size: 30,
  ),
);
