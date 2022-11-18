import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:platformx/platformx.dart';

import '../data/api_client/common/Resource.dart';
import '../data/api_client/common/Status.dart';
import '../data/api_client/service_provider.dart';
import '../data/model/response_model/login_response.dart';
import '../data/model/send_model/login_send.dart';
import '../data/repo/login_repo/home_repo.dart';
import '../data/shared_pref/shared_pref.dart';
import '../router/route_constant.dart';
import '../utils/alart_dialog.dart';
import '../utils/connection.dart';
import '../utils/store_key.dart';

import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HomeRepo loginRepo;
  SharedPref sharedPref;

  HomeController({required this.loginRepo, required this.sharedPref});

  late BuildContext context;

  TextEditingController findout_text = TextEditingController();
  TextEditingController pin_code = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isnotVisiblePin = true.obs;
  RxBool textScanning = false.obs;
  RxBool textfound = false.obs;
  RxString teststring = "".obs;
  RxString scannedText = "".obs;

  var image_picker_path = "".obs;

  @override
  void onInit() {
    sharedPref.clearData();
    super.onInit();
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        image_picker_path.value = pickedImage.path;
      }
      Get.back();
    } catch (e) {}
  }

  void getRecognisedText(File image, String text_search) async {
    textScanning.value = true;
    textfound.value = false;
    final inputImage = InputImage.fromFilePath(image.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    // final textDetector = GoogleMlKit.vision.textDetector();
    // RecognisedText recognisedText = await textDetector.processImage(inputImage);
    // await textDetector.close();
    scannedText.value = "";
    // for (TextBlock block in recognisedText.blocks) {
    //   for (TextLine line in block.lines) {
    //     scannedText = scannedText + line.text + "\n";
    //   }
    // }
    String text = recognizedText.text;
    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        scannedText.value = "${scannedText.value}${line.text}\n";
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }

    await textRecognizer.close();

    textScanning.value = false;

    if (scannedText.contains(text_search)) {
      textfound.value = true;
    }
  }
}
