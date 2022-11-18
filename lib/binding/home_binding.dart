import 'package:get/get.dart';

import '../controller/home_controller.dart';

import '../data/api_client/home_api_client/home_api_client.dart';
import '../data/api_client/home_api_client/home_api_client_impl.dart';
import '../data/repo/login_repo/home_repo.dart';
import '../data/repo/login_repo/home_repo_impl.dart';
import '../data/shared_pref/shared_pref.dart';
import '../data/shared_pref/shared_pref_impl.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SharedPref>(() =>
        SharedPrefImpl()); // Lazy instance "IHomeProvider" created [false]
    Get.lazyPut<HomeClient>(() =>
    HomeApiClientImpl()); // Lazy instance "IHomeProvider" created [false]
    Get.lazyPut<HomeRepo>(() => HomeRepoImpl(
        apiClient: Get.find(),
        sharedPref:
            Get.find())); // Lazy instance "IHomeRepository" created [false]
    Get.lazyPut(() =>
        HomeController(loginRepo: Get.find(), sharedPref: Get.find())); //
  }
}
