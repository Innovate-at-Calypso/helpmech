import 'package:flutter/material.dart';
import 'package:helpmech/Routes/app_pages.dart';
import 'package:helpmech/Routes/routes.dart';
import 'package:helpmech/Services/Provider/mech_provider.dart';
import 'package:helpmech/Services/Provider/shop_provider.dart';
import 'package:helpmech/Services/Provider/user_provider.dart';
import 'package:helpmech/Theme/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MechProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ShopProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: AppPages.route,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
