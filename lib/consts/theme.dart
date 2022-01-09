import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  backgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor:Colors.red
  ),
  primarySwatch: const MaterialColor(
    0xFFFF5967,
    <int, Color>{
      50: Color.fromRGBO(255, 89, 103, .1),
      100: Color.fromRGBO(255, 89, 103, .2),
      200: Color.fromRGBO(255, 89, 103, .3),
      300: Color.fromRGBO(255, 89, 103, .4),
      400: Color.fromRGBO(255, 89, 103, .5),
      500: Color.fromRGBO(255, 89, 103, .6),
      600: Color.fromRGBO(255, 89, 103, .7),
      700: Color.fromRGBO(255, 89, 103, .8),
      800: Color.fromRGBO(255, 89, 103, .9),
      900: Color.fromRGBO(255, 89, 103, 1),
    },
  ),
  textTheme: GoogleFonts.robotoTextTheme(),
);
