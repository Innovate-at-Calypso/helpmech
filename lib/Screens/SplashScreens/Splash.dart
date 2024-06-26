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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.lightThemePrimary,
        ),
        child: Center(
          child: Image.asset(
            AppImages.appLogo,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
