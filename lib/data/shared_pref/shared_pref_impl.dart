import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../utils/store_key.dart';
import 'shared_pref.dart';

class SharedPrefImpl extends SharedPref {
  @override
  Future<bool> isLoggedin() async {
    try {
      bool? loggedIn = await GetStorage().read(IS_LOGGED_IN);
      print(loggedIn);
      if (loggedIn == null || !loggedIn) {
        return false;
      } else {
        return true;
      }
    } catch (ex) {
      return false;
    }
  }

  @override
  Future setLoggedin(bool isLoggedin) async {
    GetStorage().write(IS_LOGGED_IN, isLoggedin);
  }

  @override
  void clearData() {
    GetStorage().erase();
  }

  @override
  Future setdata(String key, String data) async {
    GetStorage().write(key, data);
  }

  @override
  Future<String> getdata(String key) async {
    String? get_data = await GetStorage().read(key);
    return get_data ?? "";
  }
}
