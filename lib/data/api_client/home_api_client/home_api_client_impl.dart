import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/api_constant.dart';
import '../../model/response_model/login_response.dart';
import '../common/Resource.dart';
import '../common/Status.dart';
import 'home_api_client.dart';

class HomeApiClientImpl extends GetConnect implements HomeClient {
  @override
  void onInit() {
    httpClient.timeout = const Duration(minutes: TIMEOUT_DURATION);
    httpClient.baseUrl = BASE_URL;
  }

  @override
  Future<Resource> postLogin({required Map<String, dynamic> body}) async {

    final response = await post(LOGIN, FormData(body));
    if (response.status.hasError) {
      return Resource.error(message: response.statusText);
    } else {
      print(response.statusCode);
      if (response.statusCode == 200) {
        try {
          LoginResponseModel coinListModel =
              loginResponseModelFromJson(response.body);
          if (coinListModel.status == 200) {
            return Resource(status: STATUS.SUCCESS, data: coinListModel);
          } else {
            return Resource(
                status: STATUS.ERROR, message: "Something went wrong!");
          }
        } catch (e) {
          print(e);
          return Resource.error(message: "Something went wrong!!");
        }
      } else {
        return Resource.error(message: response.statusText);
      }
    }
  }
}
