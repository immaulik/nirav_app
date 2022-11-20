import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timepass/src/utils/constants/app_colors.dart';

final _AppThemes themes = _AppThemes();

class _AppThemes {
  static final _AppThemes instance = _AppThemes.internal();

  _AppThemes.internal();

  factory _AppThemes() => instance;

  static const Color _primaryColorC = AppColors.primaryColor;
  static const Color _primaryColorA = Color(0xFF040404);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  Color get primaryColor => _primaryColorA;

  Color get primaryColorA => _primaryColorA;

  Color get primaryColorC => _primaryColorC;

  final String fontFamily = GoogleFonts.dmSans().fontFamily!;

  final borderRadius = BorderRadius.circular(8.0);

  final fixedSize = const Size(double.infinity, 56);

  Color get textColor => white;

  Color get color => primaryColor;

  ThemeMode get themeMode => ThemeMode.light;

  ThemeData get light => theme(black, Brightness.light);

  ThemeData get dark => theme(white, Brightness.dark);

  ThemeData theme(Color color, Brightness brightness) {
    return ThemeData(
        androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
        primaryColor: primaryColorC,
        backgroundColor: color,
        brightness: brightness,
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: appBarTheme(
          brightness == Brightness.dark ? Color(0xff181818) : Colors.white,
          brightness == Brightness.dark
              ? Colors.white.withOpacity(0.8)
              : Colors.black,
        ),
        listTileTheme: listTileTheme(color),
        colorScheme: colorScheme(color, brightness),
        elevatedButtonTheme: elevatedButtonTheme(),
        outlinedButtonTheme: outlinedButtonTheme(color),
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontWeight: FontWeight.w500, color: color),
          bodySmall: TextStyle(fontWeight: FontWeight.w400, color: color),
          displayLarge: TextStyle(fontWeight: FontWeight.w700, color: color),
          displayMedium: TextStyle(fontWeight: FontWeight.w700, color: color),
          headlineMedium: TextStyle(fontWeight: FontWeight.w500, color: color),
          headlineSmall: TextStyle(fontWeight: FontWeight.w400, color: color),
        ),
        fontFamily: fontFamily,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: InputBorder.none,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: brightness == Brightness.dark
                ? Color(0xff181818)
                : Colors.white,
            foregroundColor: brightness == Brightness.dark
                ? Colors.white.withOpacity(0.8)
                : primaryColor));
  }

  OutlinedButtonThemeData outlinedButtonTheme(Color color) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: color,
        fixedSize: fixedSize,
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        textStyle: TextStyle(
          color: color,
          fontSize: 18,
          // fontFamily: fontFamily,
        ),
      ),
    );
  }

  ListTileThemeData listTileTheme(Color color) {
    return ListTileThemeData(horizontalTitleGap: 0);
  }

  ElevatedButtonThemeData elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColorC,
        fixedSize: fixedSize,
        textStyle: TextStyle(
            fontSize: 16, fontFamily: fontFamily, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    );
  }

  ColorScheme colorScheme(Color color, Brightness brightness) {
    if (brightness == Brightness.light) {
      return ColorScheme.light(
        primary: primaryColor,
        brightness: brightness,
      );
    }
    return ColorScheme.dark(
      primary: primaryColor,
      brightness: brightness,
    );
  }

  AppBarTheme appBarTheme(Color backColor, Color frontColor) {
    return AppBarTheme(
      elevation: 0,
      titleSpacing: 0.0,
      shadowColor: Colors.grey.withOpacity(0.1),
      backgroundColor: backColor,
      foregroundColor: frontColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(color: frontColor),
      actionsIconTheme: IconThemeData(color: Colors.grey.withOpacity(0.8)),
      titleTextStyle: TextStyle(
          color: frontColor,
          fontSize: 16,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2),
    );
  }
}