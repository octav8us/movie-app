import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/theme/app_colors.dart';

ThemeData CustomAppTheme() {
  return ThemeData(
    textTheme: GoogleFonts.robotoTextTheme().apply(
      bodyColor: AppColors.onPrimary,
      displayColor: AppColors.onPrimary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        textStyle: GoogleFonts.robotoTextTheme().bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.onPrimary,
            ),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        onSurface: AppColors.onPrimary),
  );
}
