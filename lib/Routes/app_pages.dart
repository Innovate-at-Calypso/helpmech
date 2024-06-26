import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:helpmech/Routes/routes.dart';
import 'package:helpmech/Screens/SplashScreens/Splash.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: Routes.splash, page: () => Splash()),
  ];
}
