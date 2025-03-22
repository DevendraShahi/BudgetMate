import 'package:flutter/material.dart';
import 'package:flutter_account/pages/login/LoginHomePage.dart';
import 'package:flutter_account/utils/CacheUtil.dart';
import 'package:flutter_account/utils/ColorsUtil.dart';
import 'package:flutter_account/utils/MyFontConstant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bases/BaseState.dart';
import '../utils/NavigateUtil.dart';
import '../utils/SPManager.dart';
import 'home/HomePage.dart';
import 'home/MainPage.dart';
import 'login/LoginPage.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashPageState();
  }
}

class _SplashPageState extends BaseState {
  @override
  void localAInit() {
    CacheUtil.initCache();//初始化
    ///延时操作
    Future.delayed(const Duration(milliseconds: 1000),(){
     String? accountName= CacheUtil.userMap["accountName"];
      if(accountName!=null&&accountName.isNotEmpty){
        return NavigateUtil.offAll(MainPage());
      }else{
        return NavigateUtil.offAll(LoginHomePage());
      }
    });
  }

  @override
  Widget localBuild(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsUtil.primaryColor,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            height: 220.h,
            child: Column(
              children: [
                Image.asset(
                  'images/icon_splash_logo.png',
                  width: 109.w,
                  height: 114.h,
                ),
                SizedBox(height: 5.h,),
                Text(
                  MyFontConstant.splash_font,
                  style: TextStyle(fontSize: 52.sp, color: Colors.white,fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void localCClose() {}
}
