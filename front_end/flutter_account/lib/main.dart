import 'package:flutter/material.dart';
import 'package:flutter_account/pages/SplashPage.dart';
import 'package:flutter_account/pages/home/HomePage.dart';
import 'package:flutter_account/pages/home/MainPage.dart';
import 'package:flutter_account/pages/login/LoginPage.dart';
import 'package:flutter_account/pages/transaction/AddExpensesPage.dart';
import 'package:flutter_account/utils/ConstantUtil.dart';
import 'package:flutter_account/utils/SPManager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:oktoast/oktoast.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SPManager.instance.initSp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}
final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(ConstantUtil.phoneWidth, ConstantUtil.phoneHeight),//设计稿尺寸(375*812)
      builder: (BuildContext context, Widget? child) {
        return OKToast(child:GetMaterialApp(
          navigatorKey: mainNavigatorKey,
          theme: ThemeData(primaryColor: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          // home: SplashPage(),
          home: MainPage(),
          builder: EasyLoading.init(),
        ) ,) ;
      },
    );
  }

}
