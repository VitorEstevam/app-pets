import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  backgroundColor: Colors.white,
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: Colors.red),
  primarySwatch: const MaterialColor(
    0xffFF5967,
    <int, Color>{
      50:  Color(0xffFFF6F7),
      100: Color(0xffFFEFF0),
      200: Color(0xffFFDEE1),
      300: Color(0xffFFCED2),
      400: Color(0xffFFBDC2),
      500: Color(0xffFF5967),
      600: Color(0xffFF9BA4),
      700: Color(0xffFF8B95),
      800: Color(0xffFF7A85),
      900: Color(0xffFF6A77),
    },
  ),
  textTheme: GoogleFonts.robotoTextTheme(),
);
