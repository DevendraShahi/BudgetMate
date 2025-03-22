import 'package:flutter/material.dart';
import 'package:get/get.dart';

///导航器
class NavigateUtil{
  ///跳转新页面
  static void to(dynamic widget,{Function ?callback}){
    if(callback!=null){
      Get.to(widget)?.then((value){
        callback();
      });
    }else{
      Get.to(widget);

    }
  }
  ///返回上一级
  static void back(){
      Get.back();
  }
  ///跳转新页面并关闭之前所有的页面
  static void offAll(dynamic widget){
      Get.offAll(widget);
  }
}