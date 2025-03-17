import 'package:flutter/material.dart';
import 'package:flutter_account/bases/BaseState.dart';
import 'package:flutter_account/utils/MyFontConstant.dart';
import 'package:flutter_account/utils/UIUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/MainController.dart';
import '../../utils/ColorsUtil.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends BaseState<HomePage> {
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
          Padding(
            padding: EdgeInsets.only(left: 38.w, top: 60.h),
            child: Text(
              MyFontConstant.font_hi,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 357.w,
                  height: 152.h,
                  margin: EdgeInsets.only(top: 33.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      color: ColorsUtil.color_00D09E),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 68.w,
                            height: 68.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.0, // 边框宽度
                                  color: Colors.white, // 边框颜色
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.r))),
                            child: Image.asset(
                              'images/icon_car.png',
                              width: 37.w,
                              height: 21.h,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            MyFontConstant.font_s_o_g,
                            style: TextStyle(fontSize: 12.sp),
                          )
                        ],
                      ),
                      Container(
                        width: 2.w,
                        height: 108.h,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 33.w, right: 20.w),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "images/icon_salary.png",
                                width: 31.w,
                                height: 28.h,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    MyFontConstant.font_r_l_w,
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                  Text(
                                    "\$5000",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 2.h,
                            width: 161.w,
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "images/icon_food.png",
                                width: 31.w,
                                height: 34.h,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    MyFontConstant.font_f_l_w,
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                  Text(
                                    "-\$400",
                                    style: TextStyle(
                                        color: ColorsUtil.color_0068FF,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Expanded(
                    child: Container(
                  child: ListView.builder(
                      itemCount: 10,

                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 24.h),
                          child: Row(
                            children: [
                              SizedBox(width: 37.w,),

                              Image.asset(
                                UIUtil.imgList[index % 6],
                                width: 53.w,
                                height: 53.w,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Column(
                                children: [
                                  Text(
                                    UIUtil.nameList[index % 6],
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    "2025-3-10",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsUtil.color_0068FF),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16.w,),
                              Expanded(
                                  child: Text(
                                    "I have a transaction",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              SizedBox(width: 16.w,),

                              Text(index%2==1?"\$3000":"-\$200",style: TextStyle(fontWeight: FontWeight.bold,color: index%2==1?Colors.black:ColorsUtil.color_0068FF),),
                              SizedBox(width: 37.w,),

                            ],
                          ),
                        );
                      }),
                )),
                SizedBox(
                  height: 30.h,
                ),
              ],
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
