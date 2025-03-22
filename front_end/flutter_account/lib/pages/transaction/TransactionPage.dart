import 'package:flutter/material.dart';
import 'package:flutter_account/bases/BaseState.dart';
import 'package:flutter_account/utils/NavigateUtil.dart';
import 'package:flutter_account/utils/ToastUtil.dart';
import 'package:flutter_account/utils/UIUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/ColorsUtil.dart';
import '../../utils/MyFontConstant.dart';
import 'AddExpensesPage.dart';

class TransactionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransactionPageState();
  }
}

class TransactionPageState extends BaseState<TransactionPage> {
  @override
  void localAInit() {
    // TODO: implement localAInit
  }

  @override
  Widget localBuild(BuildContext context) {
    return Scaffold(
        body: Container(
          color: ColorsUtil.primaryColor,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 64.h,),
              Center(child: Text(
                MyFontConstant.font_categories,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),),
              Container(
                margin: EdgeInsets.only(top: 42.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          MyFontConstant.font_t_i,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "\$7000",
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 36.w,
                    ),
                    Container(
                      color: Colors.white,
                      width: 1.w,
                      height: 42.h,
                    ),
                    SizedBox(
                      width: 36.w,
                    ),
                    Column(
                      children: [
                        Text(
                          MyFontConstant.font_t_e,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "-\$1250",
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorsUtil.color_0068FF),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorsUtil.color_F1FFF3,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44.r),
                            topRight: Radius.circular(44.r))),
                    child: Container(
                      child: GridView.count(
                        crossAxisCount: 2, // 指定列数为 3
                        children: List.generate(
                          6, // 生成 9 个子项
                              (index) => Container(
                                margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
                                child: GestureDetector(
                                onTap: (){
                                  int type=1;
                                  if(index==5){
                                    type=2;
                                  }
                                  NavigateUtil.to(AddExpensesPage(index: index,type:type));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(UIUtil.imgList[index]),
                                    Text(UIUtil.nameList[index])
                                  ],
                                ),
                              ),),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }


  @override
  void localCClose() {
    // TODO: implement localCClose
  }
}
