import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizing/sizing.dart';

SuccessAlart(String message,  Function onCancelTap, Function onOkTap) {
  CoolAlert.show(
    context: Get.context!,
    type: CoolAlertType.success,
    text: message,
    onCancelBtnTap: onCancelTap(),
    onConfirmBtnTap: onOkTap()

  );
}

FailureAlart(String message, {String? title ,required Function onCancelTap,}) {
  return CoolAlert.show(
    context: Get.context!,
    type: CoolAlertType.error,
    title: title ?? 'Oops...',
    text: message,
    loopAnimation: false,
    onCancelBtnTap: onCancelTap()
  );
}

CustomProgressDialog({String? msg}) {
  Get.dialog(
      Container(
        color: Colors.black12,
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.indigoAccent,
            size: 100.0.ss,
          ),
        ),
      ),
      barrierDismissible: false);
}
