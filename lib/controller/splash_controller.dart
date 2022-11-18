import 'dart:async';

import 'package:get/get.dart';

import '../data/api_client/service_provider.dart';
import '../data/shared_pref/shared_pref.dart';
import '../router/route_constant.dart';
import '../utils/store_key.dart';

class SplashController extends GetxController {
  ServiceProvider serviceProvider;
  final SharedPref sharedPref;

  SplashController({required this.serviceProvider, required this.sharedPref});

  RxString teststring="".obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    bool? profile = await sharedPref.isLoggedin();
    print(profile);

    String submit_data = await sharedPref.getdata(Submit_Registration_Data);

    Timer(
        Duration(seconds: 3),
        () => Get.offAndToNamed(Routes.home));
  }
}
