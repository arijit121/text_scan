
abstract class SharedPref {
  Future<bool> isLoggedin();
  Future setLoggedin(bool isLoggedin);
  Future setdata(String key,String data);
  Future<String> getdata(String key);
  void clearData();
}