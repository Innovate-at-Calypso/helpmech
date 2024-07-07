import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helpmech/Routes/routes.dart';
import 'package:helpmech/Screens/Mech_Splash/SignIn.dart';
import 'package:helpmech/Utils/Widget/customButton.dart';
import 'package:helpmech/Utils/app_images.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Well Come !",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 30,
                  letterSpacing: 5,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset(
                isDarkMode ? AppImages.DarkLogo : AppImages.LightLogo,
                width: screenWidth * 0.5,
                height: screenWidth * 0.5,
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton("Login As Mechanic", FontAwesomeIcons.gears, () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MechSignIn()));
              }, screenWidth, context),
              SizedBox(
                height: 10,
              ),
              CustomButton("Login As Customer", FontAwesomeIcons.person, () {
                Navigator.pushReplacementNamed(context, Routes.homePage);
              }, screenWidth, context),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Need Help ?'),
                  Text(
                    ' Link',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
