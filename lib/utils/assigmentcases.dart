import 'package:flutter/material.dart';
import 'package:home_work/screens/splash.dart';
import 'package:home_work/screens/splash_screen.dart';

class Assigmentcases {
  static const String case1 = 'case1';
  static const String case2 = 'case2';
  static const String case3 = 'case3';

  /** Method to get the widget based on the case name */
  Widget getCaseWidget(String caseName) {
    switch (caseName) {
      case case1:
        return SplashScreen();
      case case2:
        return SplashScreenTwo();
      default:
        return SplashScreen();
    }
  }
}
