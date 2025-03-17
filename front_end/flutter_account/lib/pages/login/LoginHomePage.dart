import 'package:flutter/material.dart';
import 'package:flutter_account/bases/BaseState.dart';
import 'package:flutter_account/pages/login/ForgetPswPage.dart';
import 'package:flutter_account/pages/login/LoginPage.dart';
import 'package:flutter_account/pages/login/RegistPage.dart';
import 'package:flutter_account/utils/NavigateUtil.dart';
import 'package:flutter_account/utils/ToastUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/ColorsUtil.dart';
import '../../utils/MyFontConstant.dart';
import '../../views/CustomButton.dart';

class LoginHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginHomePageState();
  }
}

class LoginHomePageState extends BaseState<LoginHomePage> {
  @override
  void localAInit() {
    // TODO: implement localAInit
  }

  @override
  Widget localBuild(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsUtil.color_F1FFF3,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            height: 620.h,
            child: Column(
              children: [
                Image.asset(
                  'images/icon_login_logo.png',
                  width: 109.w,
                  height: 114.h,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  MyFontConstant.splash_font,
                  style: TextStyle(
                      fontSize: 52.sp,
                      color: ColorsUtil.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 71.h,),
                CustomButton(
                  buttonWidth: 207.w,
                  buttonHeight: 45.h,
                  buttonRadius: 30.r,
                  buttonFont: MyFontConstant.font_log_in,
                  buttonBackgroundColor: ColorsUtil.primaryColor,
                  onTab: () => {NavigateUtil.offAll(LoginPage())},
                ),
                SizedBox(height: 12.h,),
                CustomButton(
                  buttonWidth: 207.w,
                  buttonHeight: 45.h,
                  buttonRadius: 30.r,
                  buttonFont: MyFontConstant.font_sign_up,
                  buttonBackgroundColor: ColorsUtil.color_DFF7E2,
                  buttonFontColor: Colors.black,
                  onTab: () => {NavigateUtil.offAll(RegistPage())},
                ),
                SizedBox(height: 12.h,),
                GestureDetector(
                  onTap: ()=>{
                    NavigateUtil.to(ForgetPswPage())
                  },
                  child: Text(MyFontConstant.font_forPws,style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void localCClose() {
    // TODO: implement localCClose
  }
}
