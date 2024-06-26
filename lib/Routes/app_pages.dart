import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:helpmech/Routes/routes.dart';
import 'package:helpmech/Screens/SplashScreens/Splash.dart';

class AppPages {
  static Map<String, WidgetBuilder> route = {
    Routes.splash: (context) => Splash(),
  };
}
