import 'package:flutter/material.dart';
import 'package:home_work/screens/api-screen/api_screen.dart';
import 'package:home_work/screens/assignment-1/splash.dart';
import 'package:home_work/screens/assignment-2/home_screen.dart';
import 'package:home_work/screens/assignment-3/fruit_home_screen.dart';
import 'package:home_work/screens/db-connections/screens/home_screen.dart';
import 'package:home_work/screens/y3s2/splash_screen.dart';
import 'package:home_work/screens/exercise50pt/login_screen.dart';

enum Assigmentcases {
  case1,
  case2,
  case3,
  case4,
  practicedb,
  exercise50pt,
  apiCalls;

  String get title {
    switch (this) {
      case Assigmentcases.case1:
        return "Year 3 Semester 2";
      case Assigmentcases.case2:
        return "Year 4 Semester 1 (1)";
      case Assigmentcases.case3:
        return "Year 4 Semester 1 (2)";
      case Assigmentcases.case4:
        return "Year 4 Semester 1 (3)";
      case Assigmentcases.practicedb:
        return "Year 4 Semester 1 Practice Db";
      case Assigmentcases.exercise50pt:
        return "50pt Exercise";
      case Assigmentcases.apiCalls:
        return "Api Calls";
    }
  }

  Widget get widget {
    switch (this) {
      case Assigmentcases.case1:
        return const SplashScreen();
      case Assigmentcases.case2:
        return const SplashScreenTwo();
      case Assigmentcases.case3:
        return const FruitHomeScreen();
      case Assigmentcases.case4:
        return const HomeScreen();
      case Assigmentcases.practicedb:
        return const HomeScreendb();
      case Assigmentcases.exercise50pt:
        return const LoginScreen();
      case Assigmentcases.apiCalls:
        return const ApiScreen();
    }
  }
}
