import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:savvy/app/route/Router.dart';

//加载页面
class SplashPage extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<SplashPage> {//

  @override
  void initState(){
    super.initState();

    //在加载页面停顿3秒
    new Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushNamed(Router.homePage);
    });
  }
  @override
  Widget build(BuildContext context){
//    屏幕适配
    ScreenUtil.init(context,width: 750, height: 1334, allowFontScaling: false);
    return Container(
      child: Image.asset("assets/images/launch.jpg",fit:BoxFit.fill),
    );
  }

}