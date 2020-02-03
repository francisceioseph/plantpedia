import 'package:flutter/material.dart';
import 'package:plantpedia/src/constants.dart';

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: kBackgroundColor,
  appBarTheme: AppBarTheme(
    color: kBackgroundColor,
    textTheme: TextTheme(
      title: TextStyle(
        color: kTerciaryColor,
        fontFamily: 'JosefinSans',
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  buttonColor: kTerciaryColor,
  primaryIconTheme: IconThemeData(
    color: kTerciaryAccentColor,
  ),
  accentIconTheme: IconThemeData(
    color: kAccentColor,
  ),
  primaryTextTheme: TextTheme(
      title: TextStyle(
        fontFamily: 'SF Pro Display',
        color: kTextColor,
      ),
      subtitle: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: kAccentColor,
      ),
      body1: TextStyle(
        fontFamily: 'SF Pro Display',
        color: kTerciaryColor,
      )),
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: kDarkAccentColor,
  scaffoldBackgroundColor: kDarkPrimaryColor,
  accentColor: kDarkAccentColor2,
  appBarTheme: AppBarTheme(
    color: kDarkAccentColor,
    textTheme: TextTheme(
      title: TextStyle(
        color: kTerciaryColor,
        fontFamily: 'JosefinSans',
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  buttonColor: kDarkButtonColor,
  primaryIconTheme: IconThemeData(
    color: kDarkColorIconTheme,
  ),
  accentIconTheme: IconThemeData(
    color: kDarkColorAccentIconTheme,
  ),
  primaryTextTheme: TextTheme(
    title: TextStyle(
      fontFamily: 'SF Pro Display',
      color: kDarkTextColor,
    ),
    subtitle: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: kDarkAccentColor,
    ),
    body1: TextStyle(
      fontFamily: 'SF Pro Display',
      color: kDarkTextColor,
    ),
  ),
);
