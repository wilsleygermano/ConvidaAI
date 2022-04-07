import 'package:convida_ai_1/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      titleTextStyle: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontWeight: FontWeight.normal,
        color: AppColors.textColor,
        fontSize: 24,
      ),
      iconTheme: IconThemeData(
        color: AppColors.buttonsColor,
        size: 32,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.buttonsColor),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    primaryTextTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.titlesColor,
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
