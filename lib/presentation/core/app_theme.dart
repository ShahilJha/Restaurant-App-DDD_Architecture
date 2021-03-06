import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const kPrimaryColor = Color(0xFFD9443A);
  static ThemeData generateThemeData() {
    return ThemeData(
      primaryColor: kPrimaryColor,
      accentColor: Colors.blueGrey,
      scaffoldBackgroundColor: Color(0xFFF3F3F3),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme: _getButtonThemeData(),
      dividerTheme: _getDividerThemeData(),
      checkboxTheme: _getCheckboxThemeData(),
      inputDecorationTheme: _getInputDecorationThemeData(),
      elevatedButtonTheme: _getElevatedButtonThemeData(),
    );
  }

  static ElevatedButtonThemeData _getElevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
      );

  static InputDecorationTheme _getInputDecorationThemeData() =>
      InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.w),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.w),
        ),
      );

  static DividerThemeData _getDividerThemeData() => DividerThemeData().copyWith(
        space: 50.w,
        thickness: 1.5,
        indent: 100.w,
        endIndent: 100.w,
        color: Colors.grey,
      );

  static ButtonThemeData _getButtonThemeData() => ButtonThemeData().copyWith(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        textTheme: ButtonTextTheme.primary,
      );

  static CheckboxThemeData _getCheckboxThemeData() =>
      CheckboxThemeData().copyWith(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return kPrimaryColor; // the color when checkbox is selected;
            }
            return kPrimaryColor; //the color when checkbox is unselected;
          },
        ),
      );
}
