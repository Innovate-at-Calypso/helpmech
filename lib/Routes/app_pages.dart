import 'package:flutter/material.dart';
import 'package:helpmech/Routes/routes.dart';
import 'package:helpmech/Screens/SplashScreens/Splash.dart';
import 'package:helpmech/Screens/SplashScreens/selection_screen.dart';

class AppPages {
  static Map<String, WidgetBuilder> route = {
    Routes.splash: (context) => Splash(),
    Routes.selectScreen: (context) => SelectScreen(),
  };
}
