import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'MMC',
  cardColor: Colors.white,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: const Color(0xfff6f6f6),
  iconTheme: const IconThemeData(color: Colors.black),
  primaryColor: const Color(0xff666666),
  primaryColorDark: Colors.black,
  primaryColorLight: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.black,
    selectedItemColor: Colors.redAccent,
    elevation: 0,
  ),
  primaryTextTheme: TextTheme(
    bodyText1: GoogleFonts.nunito(color: Colors.black),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
  ),
);
