import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherly/presentation/styles/colors.dart';

ThemeData lightTheme() => ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: lightPrimaryColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: lightPrimaryColor,
        ),
      ),
      scaffoldBackgroundColor: lightPrimaryColor,
    );

ThemeData darkTheme() => ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: darkPrimaryColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: darkPrimaryColor,
        ),
      ),
      scaffoldBackgroundColor: darkPrimaryColor,
    );
