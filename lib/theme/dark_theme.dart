import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  // fontFamily: 'MMC',
  brightness: Brightness.dark,
  cardColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Colors.black,
  primaryColor: Colors.white,
  primaryColorDark: Colors.black,
  primaryColorLight: Colors.white,
  iconTheme: const IconThemeData(color: Colors.white),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.red.withOpacity(0.3),
    unselectedItemColor: Colors.white,
    selectedItemColor: Colors.redAccent,
    selectedLabelStyle: GoogleFonts.nunito(
      color: Colors.redAccent,
      fontSize: 9,
    ),
    unselectedLabelStyle: GoogleFonts.nunito(
      color: Colors.white,
      fontSize: 9,
    ),
    elevation: 0,
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  primaryTextTheme: TextTheme(
    bodyText1: GoogleFonts.nunito(color: Colors.white),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);
