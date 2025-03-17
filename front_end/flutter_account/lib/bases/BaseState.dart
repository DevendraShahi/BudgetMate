import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>{
  @override
  void initState() {
    super.initState();
    LogUtil.init(isDebug: true);
    LogUtil.e(tag: "PageName",this.runtimeType.toString());
    setStateColor(initStateBarFontBlack());
    localAInit();
  }
  ///状态栏默认的字体颜色
  ///return true 是白色  false 是黑色
  bool initStateBarFontBlack(){
    return false;
  }
  ///设置状态栏颜色 true 是白色  false 是黑色
  void setStateColor(bool flag){
    print('setStateColor:$flag');
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,//这里替换你选择的颜色
        statusBarIconBrightness:flag? Brightness.light:Brightness.dark, // 状态栏字体颜色（黑色）
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return localBuild(context);
  }
  @override
  void dispose() {
    super.dispose();
    localCClose();

  }


  ///初始化
  void localAInit();

  ///创建视图
  Widget localBuild(BuildContext context);

  ///关闭回调
  void localCClose();


}