import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novelty/common/theming/app_colors.dart';

final ThemeData lightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),

    // TODO: Add the text themes
    textTheme: GoogleFonts.dmSansTextTheme(
        base.textTheme.apply(bodyColor: Colors.black)),

    iconTheme: base.iconTheme.copyWith(
      color: Colors.black,
      fill: 0.5,
    ),

    // TODO: Add the icon themes
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black12.withOpacity(0.36)),
      hintStyle: TextStyle(
        color: Colors.black12.withOpacity(0.36),
        fontSize: 12,
      ),
      alignLabelWithHint: true,
      fillColor: AppColors.light,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide:
              BorderSide(width: 0.5, color: Colors.red.withOpacity(0.2))),
    ),
  );
}
