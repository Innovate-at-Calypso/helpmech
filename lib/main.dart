import 'package:flutter/material.dart';
import 'package:helpmech/Routes/app_pages.dart';
import 'package:helpmech/Routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: AppPages.route,
    );
  }
}
