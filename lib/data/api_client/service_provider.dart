import 'package:get/get.dart';

import '../../utils/api_constant.dart';
class ServiceProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.timeout = const Duration(minutes: TIMEOUT_DURATION);
    super.onInit();
  }
}