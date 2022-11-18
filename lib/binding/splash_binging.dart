import 'package:get/get.dart';

import '../controller/splash_controller.dart';
import '../data/api_client/service_provider.dart';
import '../data/shared_pref/shared_pref.dart';
import '../data/shared_pref/shared_pref_impl.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SharedPref>(() => SharedPrefImpl()); // Lazy instance "IHomeProvider" created [false]
    Get.lazyPut(() => ServiceProvider());
    Get.put(SplashController(serviceProvider: Get.find(),sharedPref: Get.find()));
  }
}