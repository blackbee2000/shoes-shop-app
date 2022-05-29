import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  cardColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Colors.black,
  primaryColor: Colors.white,
  primaryColorDark: Colors.black,
  primaryColorLight: Colors.white,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  primaryTextTheme: TextTheme(
    bodyText1: GoogleFonts.ebGaramond(color: Colors.white),
  ),
);
