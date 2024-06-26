import 'package:flutter/material.dart';
import 'package:helpmech/Theme/theme.dart';
import 'package:helpmech/Utils/app_images.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Image.asset(
          isDarkMode ? AppImages.DarkLogo : AppImages.LightLogo,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
