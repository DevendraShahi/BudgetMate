import 'package:flutter/cupertino.dart';
import 'package:flutter_account/bases/BaseController.dart';

class MainController extends BaseController{
  var currentIndex=0;//底部导航按钮选中的下标
  final PageController pageController = PageController(initialPage: 0);//PageView的控制器
  int page=1;//页码
  ///跳转的导航页面
  void jumpToPage(var index){
    print("index:$index");
    pageController.jumpToPage(index);
    currentIndex=index;
    update();
  }

  @override
  void baseAInit() {
  }

  @override
  void baseBClose() {
    pageController.dispose();
  }


}