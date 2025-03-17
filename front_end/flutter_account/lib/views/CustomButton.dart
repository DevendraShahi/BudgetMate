import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bases/BaseState.dart';

///自定义按钮
class CustomButton extends StatefulWidget {
  var buttonWidth; //按钮宽度
  var buttonHeight; //按钮高度
  var buttonFont; //字体大小
  var buttonFontSize; //按钮字体大小
  var buttonBackgroundColor; //按钮背景色
  var buttonFontColor; //文字颜色

  double buttonRadius; //按钮圆角
  var onTab; //点击事件

  CustomButton(
      {super.key,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.buttonFont,
      this.buttonFontSize = 16.0,
      this.buttonBackgroundColor,
      this.buttonRadius = 0,
      this.buttonFontColor = Colors.white,
      required this.onTab}); //点击事件

  @override
  State<StatefulWidget> createState() {
    return CustomButtonState();
  }
}

class CustomButtonState extends BaseState<CustomButton> {
  @override
  void localAInit() {}

  @override
  Widget localBuild(BuildContext context) {
    return Container(
      width: widget.buttonWidth,
      height: widget.buttonHeight,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  widget.buttonBackgroundColor ?? Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(widget.buttonRadius ?? 0))), //圆角弧度
              textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: widget.buttonFontSize))),
          onPressed: widget.onTab,
          child: Text(widget.buttonFont,style: TextStyle(fontWeight:FontWeight.bold,color: widget.buttonFontColor),)),
    );
  }

  @override
  void localCClose() {
    // TODO: implement localCClose
  }
}
