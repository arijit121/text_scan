import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';
import '../utils/image_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(controller.teststring.value)
        ],
      ),
    );
  }
}
