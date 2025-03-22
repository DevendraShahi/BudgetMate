import 'package:flutter_account/utils/ConstantUtil.dart';
import 'package:flutter_account/utils/SPManager.dart';
import 'package:flutter_account/utils/ToastUtil.dart';
import 'package:flutter_account/utils/UIUtil.dart';

class CacheUtil{
  static Map<String,String> accountMap=Map();
  static Map<String,String> userMap=Map();
  static Map<String,String> expenseMap=Map();
  static Map<String,String> incomeMap=Map();


  static void initCache(){
    dynamic cacheAccountStr=SPManager.instance.get(ConstantUtil.AccountMap);//账户
    dynamic userInfoStr=SPManager.instance.get(ConstantUtil.UserMap);//用户信息
    dynamic expenseStr=SPManager.instance.get(ConstantUtil.ExpenseMap);//花费存储
    dynamic incomeStr=SPManager.instance.get(ConstantUtil.IncomeMap);//花费存储

    if(cacheAccountStr!=null&&cacheAccountStr!=""){
      accountMap=UIUtil.stringToMap(cacheAccountStr.toString());
    }
    if(userInfoStr!=null&&userInfoStr!=""){
      userMap=UIUtil.stringToMap(userInfoStr.toString());
    }
    if(expenseStr!=null&&expenseStr!=""){
      expenseMap=UIUtil.stringToMap(expenseStr.toString());
    }
    if(incomeStr!=null&&incomeStr!=""){
      incomeMap=UIUtil.stringToMap(incomeStr.toString());
    }
  }
  ///存储用户注册信息
  static void saveAccountMap(){
    SPManager.instance.put(ConstantUtil.AccountMap,UIUtil.mapToString(accountMap));
  }
  ///存储用户登录信息
  static void saveUserInfo(){
    SPManager.instance.put(ConstantUtil.UserMap,UIUtil.mapToString(userMap));
  }
  ///退出登录
  static void logout(){
    userMap.clear();
    SPManager.instance.put(ConstantUtil.UserMap,"");
  }

  ///存储花费
  static void addExpense(String date,String category,String amount,String title){
    int time=DateTime.now().millisecond;
    String newData="$date+$category+$amount+$title";
    if("Income"==category){
      incomeMap["$time"]=newData;
      SPManager.instance.put(ConstantUtil.IncomeMap,UIUtil.mapToString(incomeMap));
    }else{
      expenseMap["$time"]=newData;
      SPManager.instance.put(ConstantUtil.ExpenseMap,UIUtil.mapToString(expenseMap));
    }

  }
}