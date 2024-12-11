import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/constants/colors.dart';

class CTextTheme {
  CTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: CColors.primaryColor,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: CColors.primaryColor,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 17,
      fontWeight: FontWeight.normal,
      color: CColors.primaryColor,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: CColors.primaryColor,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: CColors.primaryColor,
    ),
  );
}
