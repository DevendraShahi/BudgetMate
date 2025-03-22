import 'package:get/get.dart';


abstract class BaseController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    baseAInit();
  }
  @override
  void onClose() {
    super.onClose();
    baseBClose();
  }

  void baseAInit();//初始化方法

  void baseBClose();//关闭方法
}