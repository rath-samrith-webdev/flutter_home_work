import 'package:flutter/material.dart';
import 'package:home_work/screens/assignment-1/splash.dart';
import 'package:home_work/screens/assignment-2/home_screen.dart';
import 'package:home_work/screens/y3s2/splash_screen.dart';

enum Assigmentcases {
  case1,
  case2,
  case3;

  String get title {
    switch (this) {
      case Assigmentcases.case1:
        return "Year 3 Semester 2";
      case Assigmentcases.case2:
        return "Year 4 Semester 1 (1)";
      case Assigmentcases.case3:
        return "Year 4 Semester 1 (2)";
    }
  }

  Widget get widget {
    switch (this) {
      case Assigmentcases.case1:
        return const SplashScreen();
      case Assigmentcases.case2:
        return const SplashScreenTwo();
      case Assigmentcases.case3:
        return const HomeScreen();
    }
  }
}
