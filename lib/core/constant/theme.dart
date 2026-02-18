import 'package:flutter/material.dart';

import 'app_constants.dart';
import 'appcolors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.colorWhite,
  primaryColor: AppColors.colorPrimary,
  indicatorColor: AppColors.colorWhite,

  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: AppConstants.fontFamily_Poppins,
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontFamily: AppConstants.fontFamily_Poppins,
      fontWeight: FontWeight.w200,
      fontSize: 16,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppConstants.fontFamily_Poppins,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppConstants.fontFamily_Poppins,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontFamily: AppConstants.fontFamily_Poppins,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontFamily: AppConstants.fontFamily_Poppins,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: Colors.black,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.colorBlack,
  primaryColor: AppColors.colorPrimary,
  indicatorColor: AppColors.colorBlack,
  // primaryColor: Colors.teal,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: AppConstants.fontFamily_Poppins,
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontFamily: AppConstants.fontFamily_Poppins,
      fontWeight: FontWeight.w200,
      fontSize: 16,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppConstants.fontFamily_Poppins,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppConstants.fontFamily_Poppins,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: AppConstants.fontFamily_Poppins,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontFamily: AppConstants.fontFamily_Poppins,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: Colors.white,
    ),
  ),
);

// class ThemeCubit extends Cubit<ThemeMode> {
//   ThemeCubit() : super(ThemeMode.light);
//
//   void toggleTheme() {
//     emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
//   }
//
//   void setLight() => emit(ThemeMode.light);
//   void setDark() => emit(ThemeMode.dark);
// }
