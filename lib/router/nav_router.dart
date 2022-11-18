import 'package:get/get.dart';

import '../binding/home_binding.dart';
import '../router/route_constant.dart';



import '../binding/splash_binging.dart';

import '../screen/home_scr.dart';

import '../screen/splash.dart';


class NavRouter {
  static final generateRoute = [
    GetPage(
        name: Routes.splash,
        page: () => Splash(),
        transitionDuration: Duration(milliseconds: 100),
        binding: SplashBinding()),
    GetPage(
        name: Routes.home,
        page: () => Home(),
        transitionDuration: Duration(milliseconds: 100),
        binding: LoginBinding()),

  ];
}
