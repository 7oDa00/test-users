import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';

import '../directory/colors.dart';

ThemeData appTheme() => ThemeData(
  brightness: Brightness.light,
  textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF808080),
      )
  ),
  appBarTheme: const AppBarTheme(
      color: Colors.offWhite,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "arabicFont"
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.offWhite,
        statusBarColor: Colors.transparent,
      ),
      iconTheme: IconThemeData(
          color: Colors.black
      )
  ),
  cardColor: Colors.offWhite,
  backgroundColor: Colors.white,
  hintColor: const Color(0xFF808080),
  iconTheme: const IconThemeData(
      color: Colors.black
  ),
  shadowColor: Colors.whiteShadow,
  dialogBackgroundColor: Colors.white,
  fontFamily: "arabicFont",
  unselectedWidgetColor: Colors.black
);