import 'dart:io';

Future<bool> isInternetAvailable() async {
  try {
    final result = await InternetAddress.lookup('www.google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}

const NO_INTERNET = "No internet connection in your device!!!";
