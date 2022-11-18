


import '../common/Resource.dart';

abstract class HomeClient {
  Future<Resource> postLogin({required Map<String, dynamic> body});
}