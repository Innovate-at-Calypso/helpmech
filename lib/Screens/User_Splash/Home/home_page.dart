import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:helpmech/Screens/User_Splash/Home/mechanics.dart';
import 'package:helpmech/Utils/Widget/menu_cell.dart';
import 'package:helpmech/Utils/Widget/plan_row.dart';
import 'package:helpmech/Utils/app_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List planArr = [];

  List menuData = [
    {
      "name": "I Need Petrol",
      "image": "Assets/Images/petrol.webp",
      "tag": "1",
    },
    {
      "name": "I Need Mechanic",
      "image": "Assets/Images/mechanic.jpg",
      "tag": "2",
    },
    {
      "name": "Settings",
      "image": "Assets/Images/menu_settings.png",
      "tag": "3",
    },
    {
      "name": "Support",
      "image": "Assets/Images/menu_support.png",
      "tag": "4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      drawer: Drawer(
        width: media.width,
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Stack(
            children: [
              Container(
                width: media.width * 0.78,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Column(
                      children: [
                        Container(
                          height: kTextTabBarHeight,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(22.5),
                                child: Image.asset(
                                  'Assets/Images/mechanic.jpg', // Adjusted image asset path

                                  // user profile here
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  "User Name",

                                  //user name here
                                  style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        const Divider(
                          color: Colors.black26,
                          height: 5,
                        ),
                        SizedBox(height: 15),
                        Expanded(
                            child: ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 50),
                                itemCount: planArr.length,
                                itemBuilder: (context, index) {
                                  var itemObj = planArr[index] as Map? ?? {};

                                  return PlanRow(
                                    mObj: itemObj,
                                    onPressed: () {
                                      switch (itemObj["tag"].toString()) {
                                        case "1":
                                          break;
                                        case "2":
                                          break;
                                        case "3":
                                          break;
                                      }
                                    },
                                  );
                                })),
                        Container(
                          height: kTextTabBarHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Switch Account",
                                style: TextStyle(
                                  fontSize: 18,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Image.asset(
                                  "Assets/Images/next_go.png",
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  // add arrow image here
                                  width: 18,
                                  height: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.black,
                    expandedHeight: media.width * 0.8,
                    collapsedHeight: kToolbarHeight + 150,
                    pinned: true,
                    flexibleSpace: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image.asset(
                          isDarkMode ? AppImages.DarkLogo : AppImages.LightLogo,
                          width: media.width,
                          height: media.width * 0.8,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: media.width,
                          height: media.width * 0.8,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 30),
                          child: Row(
                            children: [
                              Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "Assets/Images/mechanic.jpg"),
                                    // user profile photo here
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "User Name",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "Profile",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ];
              },
              body: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Adjust the crossAxisCount as needed
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.75, // Adjust the aspect ratio as needed
                ),
                itemCount: menuData.length,
                itemBuilder: (context, index) {
                  var mObj = menuData[index] as Map? ?? {};
                  return MenuCell(
                    mObj: mObj,
                    onPressed: () {
                      // Handle navigator
                      switch (mObj["tag"].toString()) {
                        case "1":
                          break;
                        case "2":
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MechanicsSearch()));
                          break;
                        case "3":
                          break;
                        case "4":
                          break;
                      }
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Copyright © 2024 Calypso',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
