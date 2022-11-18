import '../../api_client/common/Resource.dart';
import '../../api_client/home_api_client/home_api_client.dart';

abstract class HomeRepo {
  HomeRepo({required this.apiClient});

  final HomeClient apiClient;

  Future<Resource> postLogin({body});
}
