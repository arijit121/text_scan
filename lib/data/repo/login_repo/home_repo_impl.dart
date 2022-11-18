
import '../../api_client/common/Resource.dart';
import '../../api_client/home_api_client/home_api_client.dart';
import '../../shared_pref/shared_pref.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({required this.apiClient,required this.sharedPref});
  final HomeClient apiClient;
  final SharedPref sharedPref;


  @override
  Future<Resource> postLogin({body}) async {
    Resource cases = await apiClient.postLogin(body: body);
    return cases;
  }

}