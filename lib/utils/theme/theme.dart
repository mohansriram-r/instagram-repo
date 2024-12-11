import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/constants/colors.dart';
import 'package:instagram_clone/utils/theme/custom_widgets/text_theme.dart';

class CThemeData {
  CThemeData._();

  static ThemeData darkThemeData = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: CColors.mobileBackgroundColor,
    textTheme: CTextTheme.lightTextTheme,
  );
}
