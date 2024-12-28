import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/constants/colors.dart';

class CBottomNavigationBarTheme {
  CBottomNavigationBarTheme._();

  static BottomNavigationBarThemeData appBarTheme =
      BottomNavigationBarThemeData(
    backgroundColor: CColors.mobileBackgroundColor,
    selectedItemColor: CColors.primaryColor,
    unselectedItemColor: CColors.secondaryColor,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    enableFeedback: false,
  );
}
