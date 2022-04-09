// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';

import 'colors.dart';
import 'font_family.dart';

// ignore: duplicate_ignore
final ThemeData themeData = new ThemeData(
  fontFamily: FontFamily.poppinsRegular,
  brightness: Brightness.light,
  primarySwatch: MaterialColor(AppColors.orange[500]!.value, AppColors.orange),
  primaryColor: Colors.blue,
  primaryColorBrightness: Brightness.light,
  // ignore: deprecated_member_use
  accentColor: AppColors.orange[500],
  // ignore: deprecated_member_use
  accentColorBrightness: Brightness.light,
  splashColor: AppColors.orange[700],
  backgroundColor: Color.fromRGBO(246, 249, 254, 1),
  buttonColor: Color.fromRGBO(39, 173, 96, 1),
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.poppinsRegular,
  brightness: Brightness.dark,
  primaryColor: AppColors.orange[500],
  primaryColorBrightness: Brightness.dark,
  accentColor: AppColors.orange[500],
  accentColorBrightness: Brightness.dark,
);
