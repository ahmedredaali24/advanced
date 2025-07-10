
import 'package:advanced_app/presentation/resources/style_manager.dart';
import 'package:advanced_app/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';

import 'color_manger.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorManger.primary,
    primaryColorLight: ColorManger.lightPrimary,
    primaryColorDark: ColorManger.darkPrimary,
    disabledColor: ColorManger.gray,
    splashColor: ColorManger.lighterGray,
    //cardView
    cardTheme: const CardTheme(
      color: ColorManger.white,
      shadowColor: ColorManger.lightGray,
      elevation: AppSize.s4,
    ),

    //app bar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManger.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManger.lightPrimary,
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManger.white,
      ),
    ),
    //button
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManger.gray,
        buttonColor: ColorManger.primary,
        splashColor: ColorManger.lightPrimary),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: ColorManger.primary,
      textStyle:
          getRegularStyle(color: ColorManger.white, fontSize: FontSize.s17),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    )),

    //text
    textTheme: TextTheme(
      headlineMedium:
          getBoldStyle(color: ColorManger.darkGray, fontSize: FontSize.s16),
      labelMedium:
          getMediumStyle(color: ColorManger.lightGray, fontSize: FontSize.s14),
      labelSmall: getRegularStyle(color: ColorManger.gray),
      bodyMedium: getRegularStyle(color: ColorManger.lightGray),
      displayLarge:
          getLightStyle(color: ColorManger.white, fontSize: FontSize.s22),
    ),
    // input decoration
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle:
          getRegularStyle(color: ColorManger.gray, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManger.gray, fontSize: FontSize.s14),
      errorStyle:
          getRegularStyle(color: ColorManger.error, fontSize: FontSize.s14),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.gray, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
