import 'package:flutter/material.dart';
import 'package:flutter_application_4/Appcolor.dart';

class Apptheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Appcolor.blackColor,

    appBarTheme: AppBarTheme(
      color: Appcolor.blackColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Appcolor.goldColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Appcolor.goldColor,
      selectedIconTheme: const IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(color: Appcolor.blackColor),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedLabelStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Appcolor.blackColor,
      primary: Appcolor.blackColor,
      secondary: Appcolor.goldColor,
    ),
  );
}
