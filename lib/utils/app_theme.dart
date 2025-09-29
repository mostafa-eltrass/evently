import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
     focusColor: AppColors.whiteColor,
     dividerColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    primaryColor: AppColors.primaryLight,
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20Black,
      headlineMedium: AppStyles.medium16Primary,
      headlineSmall:  AppStyles.medium16White,
      titleLarge: AppStyles.medium16Black
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.transparentColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor,
      showSelectedLabels: true,
      selectedLabelStyle: AppStyles.bold12White,
      unselectedLabelStyle: AppStyles.bold12White,
    ),
   floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryLight,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(
        color: AppColors.whiteColor,
        width: 4
      )
    )
  )
 , appBarTheme: AppBarTheme(
    
    )
  ); 

  static final ThemeData darkTheme = ThemeData(

    focusColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.primaryDark,
    primaryColor: AppColors.primaryDark,
    dividerColor: AppColors.whiteColor,
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20White,
      headlineMedium: AppStyles.medium16White,
      headlineSmall:  AppStyles.medium16White,
      titleLarge: AppStyles.medium16White
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.transparentColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor,
      showSelectedLabels: true,
      selectedLabelStyle: AppStyles.bold12White,
      unselectedLabelStyle: AppStyles.bold12White,
    ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryDark,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(
        color: AppColors.whiteColor,
        width: 4
      )
    )
  )
   , appBarTheme: AppBarTheme(
    
    )
  );
}
