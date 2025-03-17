
import 'package:common_utils/common_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPManager{

  SharedPreferences? sp ;

  static SPManager _instance = SPManager._();
  static SPManager get instance => _instance;

  factory SPManager (){
    return _getInstance();
  }
  // 静态、同步、私有访问点
  static SPManager _getInstance() {
    return _instance;
  }

  ///私有构造方法
  SPManager._();


  ///需要再main.datt中先调用
  initSp() async {
    if(sp == null){
      sp = await SharedPreferences.getInstance();
    }
    LogUtil.v("需要再main.datt中先调用");
  }

  put (String key,var value) {
    if(value is String){
      sp!.setString(key, value);
    }else if(value is int){
      sp!.setInt(key, value);
    }else if(value is bool){
      sp!.setBool(key, value);
    }else if(value is double){
      sp!.setDouble(key, value);
    }
  }
  T? get<T> (String key) {
    var value = sp!.get(key);
    return value as T?;
  }

  String? getToken(){
    return sp!.get("token") as String?;
  }

  saveToken(String token){
    put("token", token);
  }

  dynamic getUserId(){
    return sp!.get("userId");
  }

  saveUserId(var userId){
    put("userId", userId);
  }

  dynamic getImToken(){
    return sp!.get("imToken");
  }

  saveImToken(var imToken){
    put("imToken", imToken);
  }

  clear(){
    sp!.clear();
  }

  remove(String key){
    sp!.remove(key);
  }

  bool containsKey(String key){
    return sp!.containsKey(key);
  }

  bool isLogin(){
    if(getToken() != null){
      return true;
    }
    return false;
  }
}