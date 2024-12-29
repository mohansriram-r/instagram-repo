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
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: CColors.primaryColor,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: CColors.primaryColor,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: CColors.primaryColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: CColors.primaryColor,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.normal,
      color: CColors.primaryColor,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: CColors.primaryColor,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: CColors.primaryColor,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: CColors.primaryColor,
    ),
  );
}
