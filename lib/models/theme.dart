import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFFED7D31));
var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFFFF4700), brightness: Brightness.dark);

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      // appBarTheme: const AppBarTheme().copyWith(
      //     backgroundColor: kColorScheme.secondary,
      //     foregroundColor: kColorScheme.onPrimary,
      //     elevation: 1),
      cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
              foregroundColor: kColorScheme.onPrimaryContainer)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: kColorScheme.secondaryContainer,
            foregroundColor: kColorScheme.onSecondaryContainer,
          )),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: kColorScheme.onSecondaryContainer),
        titleMedium: GoogleFonts.almarai(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kColorScheme.onSecondaryContainer),
        titleSmall: GoogleFonts.almarai(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: kColorScheme.onSecondaryContainer),
        bodyMedium: GoogleFonts.almarai(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: kColorScheme.onSecondaryContainer),
      ));

  static ThemeData darkTheme = ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      // appBarTheme: const AppBarTheme().copyWith(
      //     backgroundColor: kDarkColorScheme.primary,
      //     foregroundColor: kDarkColorScheme.onPrimary,
      //     elevation: 1),
      cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: kDarkColorScheme.secondaryContainer,
            foregroundColor: kDarkColorScheme.onSecondaryContainer,
          )),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: kDarkColorScheme.onSecondaryContainer),
        titleMedium: GoogleFonts.almarai(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kDarkColorScheme.onSecondaryContainer),
        titleSmall: GoogleFonts.almarai(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: kDarkColorScheme.onSecondaryContainer),
        bodyMedium: GoogleFonts.almarai(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: kDarkColorScheme.onSecondaryContainer),
      ));
}
