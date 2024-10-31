import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherly/presentation/styles/colors.dart';
import 'package:weatherly/presentation/themes/custom_themes/text_theme.dart';

ThemeData lightTheme() => ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: lightPrimaryColor,
        ),
      ),
      scaffoldBackgroundColor: lightPrimaryColor,
      textTheme: lightTextTheme,
    );

ThemeData darkTheme() => ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: darkPrimaryColor,
        ),
      ),
      scaffoldBackgroundColor: darkPrimaryColor,
      textTheme: darkTextTheme,
    );
