import 'package:flutter/material.dart';
import 'package:plantpedia/src/constants.dart';

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: kBackgroundColor,
  accentColor: kGreen30,
  appBarTheme: AppBarTheme(
    color: kBackgroundColor,
    textTheme: TextTheme(
      title: TextStyle(
        color: kGreen30,
        fontFamily: 'JosefinSans',
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  buttonColor: kGreen30,
  primaryIconTheme: IconThemeData(
    color: kGreen30,
  ),
  accentIconTheme: IconThemeData(
    color: kOrange,
  ),
  cardTheme: CardTheme(
    color: kBackgroundColor2,
  ),
  primaryTextTheme: TextTheme(
    title: TextStyle(
      fontFamily: 'SF Pro Display',
      color: kGreen90,
    ),
    subhead: TextStyle(
      fontFamily: 'SF Pro Display',
      color: kGreen90,
    ),
    subtitle: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 12,
      color: kGreen10,
    ),
    body1: TextStyle(
      fontFamily: 'SF Pro Display',
      color: kGreen90,
    ),
  ),
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: kGreen50,
  scaffoldBackgroundColor: kGreen90,
  accentColor: kYellow,
  appBarTheme: AppBarTheme(
    color: kGreen70,
    textTheme: TextTheme(
      title: TextStyle(
        color: kAlternateTextColor,
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
  cardTheme: CardTheme(
    color: kGreen40,
  ),
  primaryTextTheme: TextTheme(
    title: TextStyle(
      fontFamily: 'SF Pro Display',
      color: kDarkTextColor,
    ),
    subhead: TextStyle(
      fontFamily: 'SF Pro Display',
      color: kGreen10,
    ),
    subtitle: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: kGreen10,
    ),
    body1: TextStyle(
      fontFamily: 'SF Pro Display',
      color: kDarkTextColor,
    ),
  ),
);
