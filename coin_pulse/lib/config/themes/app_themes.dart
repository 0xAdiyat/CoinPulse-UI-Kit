import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        textTheme:
            GoogleFonts.titilliumWebTextTheme(Theme.of(context).textTheme),
      );

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData.dark().copyWith();
}
