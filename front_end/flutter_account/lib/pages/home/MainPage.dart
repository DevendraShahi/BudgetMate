import 'package:flutter/material.dart';
import 'package:flutter_account/bases/BaseState.dart';
import 'package:flutter_account/pages/analysis/AnalysisPage.dart';
import 'package:flutter_account/pages/home/HomePage.dart';
import 'package:flutter_account/pages/mine/MinePage.dart';
import 'package:flutter_account/pages/transaction/TransactionPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/MainController.dart';
import '../../utils/ColorsUtil.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends BaseState {
  MainController controller = Get.put(MainController());

  @override
  void localAInit() {
    // TODO: implement localAInit
  }

  @override
  Widget localBuild(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(), //禁止滑动
        //顶部视图
        children: [HomePage(), AnalysisPage(), TransactionPage(),MinePage()],
      ),
      bottomNavigationBar: GetBuilder(
        builder: (MainController controller) {
          return BottomNavigationBar(
            onTap: (index) {
              //选中的下标
              controller.jumpToPage(index);
              print('heihei$index');
              // if(index==0){
              //   setStateColor(true);
              // }else if(index==1){
              //   setStateColor(false);
              // }else{
              //   setStateColor(true);
              // }
            },
            currentIndex: controller.currentIndex,
            selectedItemColor: ColorsUtil.primaryColor,
            unselectedItemColor: Color(0xFF4B4D5E),
            selectedFontSize: 11.sp,
            unselectedFontSize: 11.sp,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            items: [
              BottomNavigationBarItem(
                  label: "",
                  icon: controller.currentIndex == 0
                      ? Container(
                          width: 47.w,
                          height: 43.w,
                          decoration: BoxDecoration(
                              color: ColorsUtil.color_00D09E,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r))),
                          child: Center(
                            child: Image.asset(
                              "images/icon_bottom_home1.png",
                              width: 20.w,
                              height: 20.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      : Center(
                          child: Image.asset(
                            "images/icon_bottom_home1.png",
                            width: 20.w,
                            height: 20.w,
                          ),
                        )),
              BottomNavigationBarItem(
                  label: "",
                  icon: controller.currentIndex == 1
                      ? Container(
                          width: 47.w,
                          height: 43.w,
                          decoration: BoxDecoration(
                              color: ColorsUtil.color_00D09E,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r))),
                          child: Center(
                            child: Image.asset(
                              "images/icon_bottom_analysis.png",
                              width: 20.w,
                              height: 20.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      : Center(
                          child: Image.asset(
                            "images/icon_bottom_analysis.png",
                            width: 20.w,
                            height: 20.w,
                          ),
                        )),
              BottomNavigationBarItem(
                  label: "",
                  icon: controller.currentIndex == 2
                      ? Container(
                          width: 47.w,
                          height: 43.w,
                          decoration: BoxDecoration(
                              color: ColorsUtil.color_00D09E,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r))),
                          child: Center(
                            child: Image.asset(
                              "images/icon_bottom_tran.png",
                              width: 20.w,
                              height: 20.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      : Center(
                          child: Image.asset(
                            "images/icon_bottom_tran.png",
                            width: 20.w,
                            height: 20.w,
                          ),
                        )),
              BottomNavigationBarItem(
                  label: "",
                  icon: controller.currentIndex == 3
                      ? Container(
                    width: 47.w,
                    height: 43.w,
                    decoration: BoxDecoration(
                        color: ColorsUtil.color_00D09E,
                        borderRadius:
                        BorderRadius.all(Radius.circular(20.r))),
                    child: Center(
                      child: Image.asset(
                        "images/icon_bottom_mine.png",
                        width: 20.w,
                        height: 20.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                      : Center(
                    child: Image.asset(
                      "images/icon_bottom_mine.png",
                      width: 20.w,
                      height: 20.w,
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }

  @override
  void localCClose() {
    // TODO: implement localCClose
  }
}
