import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpmech/Routes/app_pages.dart';
import 'package:helpmech/Routes/routes.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          title: 'HelpMech',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splash,
          getPages: AppPages.pages,
        ));
  }
}
