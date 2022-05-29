import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  cardColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  primaryColor: Colors.black,
  primaryColorDark: Colors.white,
  primaryColorLight: Colors.black,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  primaryTextTheme: TextTheme(
    bodyText1: GoogleFonts.ebGaramond(color: Colors.white),
  ),
);
