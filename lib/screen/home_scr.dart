import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../utils/const.dart';
import '../utils/image_utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../router/route_constant.dart';
import '../utils/validator.dart';
import 'package:sizing/sizing.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#EBEBF6"),
      body: Form(
        key: controller.formKey,
        child: Obx(
          () => ListView(
            children: [
              GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                    title: "",
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.grey,
                                shadowColor: Colors.grey[400],
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                              onPressed: () {
                                controller.getImage(ImageSource.gallery);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 30,
                                    ),
                                    Text(
                                      "Gallery",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[600]),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.grey,
                                shadowColor: Colors.grey[400],
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                              onPressed: () {
                                controller.getImage(ImageSource.camera);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.camera_alt,
                                      size: 30,
                                    ),
                                    Text(
                                      "Camera",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[600]),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  );
                },
                child: controller.image_picker_path.value != ""
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        // width: MediaQuery.of(context).size.width * 0.5,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                  File(controller.image_picker_path.value)),
                              fit: BoxFit.fitWidth,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))))
                    : const Icon(
                        Icons.fullscreen_rounded,
                        size: 240,
                      ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(10.0),
                // ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: TextFormField(
                    controller: controller.findout_text,
                    // validator: (value) {
                    //   return Validator()
                    //       .textFieldValidation(value, "Enter Valid text");
                    // },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // maxLength: 10,
                    onChanged: (val) {
                      controller.textfound.value = false;
                    },
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffix: GestureDetector(
                          onTap: () {
                            if (controller.findout_text.text.length > 3 &&
                                controller.image_picker_path.value != "") {
                              controller.getRecognisedText(
                                  File(controller.image_picker_path.value),
                                  controller.findout_text.text);
                            } else if (controller.image_picker_path.value ==
                                "") {
                              Get.snackbar("Image", "Please Choose a img",
                                  snackPosition: SnackPosition.BOTTOM);
                            } else {
                              Get.snackbar("Text", "Please Enter avalid text",
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          },
                          child: const Icon(Icons.search_outlined)),
                      counterText: "",
                      focusColor: Colors.white,
                      //add prefix icon
                      // prefixIcon: Icon(
                      //   Icons.phone_android_rounded,
                      //   color: Colors.grey,
                      // ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      hintText: "Enter Find Text",

                      //make hint text
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),

                      //create lable
                      // labelText: 'Mobile',
                      //lable style
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              controller.textfound.value
                  ? Container(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Found text"),
                          const Icon(
                            Icons.forward_outlined,
                            color: Colors.blue,
                          ),
                          Text(controller.findout_text.text)
                        ],
                      ),
                    )
                  : controller.textScanning.value
                      ? Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  (MediaQuery.of(context).size.width - 40) / 2),
                          child: CircularProgressIndicator())
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
