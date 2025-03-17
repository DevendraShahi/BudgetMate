import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_account/bases/BaseState.dart';
import 'package:flutter_account/utils/CacheUtil.dart';
import 'package:flutter_account/utils/MyFontConstant.dart';
import 'package:flutter_account/utils/NavigateUtil.dart';
import 'package:flutter_account/utils/ToastUtil.dart';
import 'package:flutter_account/utils/UIUtil.dart';
import 'package:flutter_account/views/CustomButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/MainController.dart';
import '../../utils/ColorsUtil.dart';

class AddExpensesPage extends StatefulWidget {
  int index;
  int type; //1消费 2收入

  AddExpensesPage({super.key, this.index = 0, this.type = 1});

  @override
  State<StatefulWidget> createState() {
    return AddExpensesPageState();
  }
}

class AddExpensesPageState extends BaseState<AddExpensesPage> {
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [];
  String choiceTime = UIUtil.getLocalTime();
  String choiceType = "";
  TextEditingController amountController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  void localAInit() {
    choiceType = UIUtil.nameList[widget.index];
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
          SizedBox(
            height: 64.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {


                  NavigateUtil.back();
                },
                child: Image.asset(
                  "images/icon_back_white.png",
                  width: 24.w,
                  height: 19.h,
                ),
              ),
              Text(
                widget.type == 1
                    ? MyFontConstant.font_add_exp
                    : MyFontConstant.font_add_income,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "  ",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 130.h,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: ColorsUtil.color_F1FFF3,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(44.r),
                    topRight: Radius.circular(44.r))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 54.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyFontConstant.font_data,
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.dialog(
                            //const Text("This is dialog"),
                            ///这里控制dialog中的组件，可以是简单的文本，也可以是多种组件的组合
                            Container(
                              color: ColorsUtil.color_half_translate,
                              child: Center(
                                child: Container(
                                  width: 350.w,
                                  height: 500.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.r)),
                                      color: Colors.white),
                                  child: CalendarDatePicker2(
                                    config: CalendarDatePicker2Config(),
                                    value:
                                        _singleDatePickerValueWithDefaultValue,
                                    onValueChanged: (dates) {
                                      _singleDatePickerValueWithDefaultValue =
                                          dates;
                                      int year =
                                          _singleDatePickerValueWithDefaultValue[
                                                  0]!
                                              .year;
                                      int month =
                                          _singleDatePickerValueWithDefaultValue[
                                                  0]!
                                              .month;
                                      int day =
                                          _singleDatePickerValueWithDefaultValue[
                                                  0]!
                                              .day;

                                      String str_year = "${year}-$month-$day";
                                      setState(() {
                                        choiceTime = str_year;
                                      });
                                      Get.back();
                                    },
                                  ),
                                ),
                              ),
                            ),

                            ///不设置此属性不会有淡入淡出的效果，这里相当于给模糊层设置了一个淡入淡出的效果
                            transitionDuration: const Duration(
                              milliseconds: 500,
                            ),
                          );
                        },
                        child: Container(
                            height: 41.h,
                            width: 320.w,
                            padding: EdgeInsets.only(left: 10.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                                color: ColorsUtil.color_DFF7E2),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "$choiceTime",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyFontConstant.font_category,
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            //const Text("This is dialog"),
                            ///这里控制dialog中的组件，可以是简单的文本，也可以是多种组件的组合
                            Container(
                              height: 400.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.r),
                                      topLeft: Radius.circular(20.r)),
                                  color: Colors.white),
                              child: ListView.builder(
                                  itemCount: UIUtil.nameList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        setState(() {
                                          choiceType = UIUtil.nameList[index];
                                        });
                                        Get.back();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 18.h),
                                        child: Column(
                                          children: [
                                            Text(
                                              "${UIUtil.nameList[index]}",
                                              style: TextStyle(fontSize: 30.sp),
                                            ),
                                            SizedBox(
                                              height: 18.h,
                                            ),
                                            Container(
                                              height: 1.h,
                                              color: ColorsUtil.text_E9,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),

                            ///不设置此属性不会有淡入淡出的效果，这里相当于给模糊层设置了一个淡入淡出的效果
                            enterBottomSheetDuration: const Duration(
                              milliseconds: 300,
                            ),
                            exitBottomSheetDuration: const Duration(
                              milliseconds: 300,
                            ),
                          );
                        },
                        child: Container(
                            height: 41.h,
                            width: 320.w,
                            padding: EdgeInsets.only(left: 10.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                                color: ColorsUtil.color_DFF7E2),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "$choiceType",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyFontConstant.font_amount,
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                          height: 41.h,
                          width: 320.w,
                          padding: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r)),
                              color: ColorsUtil.color_DFF7E2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("\$"),
                              SizedBox(
                                width: 5.w,
                              ),
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  controller: amountController,
                                  keyboardType: TextInputType.number,
                                  // 可选，指定键盘类型为数字键盘
                                  inputFormatters: [
                                    FilteringTextInputFormatter(
                                        RegExp("[0-9.]"),
                                        allow: true),
                                  ],
                                  decoration: InputDecoration(
                                    hintText: MyFontConstant.font_ple_amount,
                                    // 输入框标签

                                    contentPadding: EdgeInsets.all(0),

                                    border: OutlineInputBorder(
                                      borderSide: BorderSide
                                          .none, // 也可以将borderSide的宽度设置为0
                                      // 或者使用以下方式将颜色设置为透明
                                      // borderSide: BorderSide(color: Colors.transparent),
                                    ), // 输入框边框样式
                                  ),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyFontConstant.font_expense_title,
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                          height: 41.h,
                          width: 320.w,
                          padding: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r)),
                              color: ColorsUtil.color_DFF7E2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    hintText:
                                        MyFontConstant.font_ple_expense_title,
                                    contentPadding: EdgeInsets.all(0),

                                    border: OutlineInputBorder(
                                      borderSide: BorderSide
                                          .none, // 也可以将borderSide的宽度设置为0
                                      // 或者使用以下方式将颜色设置为透明
                                      // borderSide: BorderSide(color: Colors.transparent),
                                    ), // 输入框边框样式
                                  ),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 106.h,
                  ),
                  CustomButton(
                      buttonBackgroundColor: ColorsUtil.color_00D09E,
                      buttonRadius: 30.r,
                      buttonWidth: 169.w,
                      buttonHeight: 36.h,
                      buttonFont: MyFontConstant.font_save,
                      onTab: () {
                        if (choiceTime.isEmpty) {
                          ToastUtil.toast(MyFontConstant.font_ple_se_date);
                          return;
                        }
                        if (choiceType.isEmpty) {
                          ToastUtil.toast(MyFontConstant.font_ple_se_cate);
                          return;
                        }
                        String amount = amountController.text;
                        if (amount.isEmpty) {
                          ToastUtil.toast(MyFontConstant.font_ple_amount);
                          return;
                        }
                        String title = titleController.text;
                        if (title.isEmpty) {
                          ToastUtil.toast(
                              MyFontConstant.font_ple_expense_title);
                          return;
                        }
                        if(widget.type == 1){
                          //花费
                          ToastUtil.toast("Expense");

                        }else{
                          //收入
                          ToastUtil.toast("Income");
                        }
                        CacheUtil.addExpense(
                            choiceTime, choiceType, amount, title);
                        ToastUtil.toast(MyFontConstant.font_s_s);
                        Get.back();
                      })
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }

  @override
  void localCClose() {}
}
