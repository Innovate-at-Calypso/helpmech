import 'package:flutter/material.dart';
import 'package:helpmech/Routes/app_pages.dart';
import 'package:helpmech/Routes/routes.dart';
import 'package:helpmech/Services/authServices.dart';
import 'package:helpmech/Theme/theme.dart';
import 'package:helpmech/Utils/app_images.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      Authservices.checkUser(context);
    });
  }

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
