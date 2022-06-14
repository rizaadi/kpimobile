import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeData getThemeData = ThemeData(
    primarySwatch: const MaterialColor(
      0xff26A0C9,
      <int, Color>{
        50: Color(0x1aF5E0C3),
        100: Color(0xa1F5E0C3),
        200: Color(0xaaF5E0C3),
        300: Color(0xafF5E0C3),
        400: Color(0xffF5E0C3),
        500: Color(0xffEDD5B3),
        600: Color(0xffDEC29B),
        700: Color(0xffC9A87C),
        800: Color(0xffB28E5E),
        900: Color(0xff936F3E)
      },
    ),
    primaryColor: const Color(0xffEDD5B3),
    textTheme: const TextTheme(
        headline3: TextStyle(fontFamily: 'Poppins', fontSize: 12)),
    fontFamily: 'Poppins',
    cardColor: const Color(0xff26A0C9)
  );
}
