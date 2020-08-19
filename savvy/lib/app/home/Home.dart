///
///  HomePage.Dart
///  savvy
///
///  Created by CW on 2020/8/14.
///  Copyright © 2020 wx. All rights reserved.
///

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:savvy/app/base/BaseWidget.dart';
import 'package:savvy/app/common/Constant.dart';
import 'package:savvy/app/provider/DarkMode.dart';
import 'package:savvy/app/provider/Store.dart';
import 'package:savvy/app/utils/SpUtil.dart';
import 'package:savvy/app/widgets/Loading.dart';
import 'package:savvy/generated/l10n.dart';

class HomePage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    // TODO: implement getState
    return _HomePageState();
  }
}

class _HomePageState extends BaseWidgetState<HomePage> {
  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth,
      color: Colors.green,
      child: Column(
        children: [
          FlatButton(
            child: Text('英文'),
            onPressed: (){
              setState(() {
                S.load(Locale('en', 'US'));
              });
            },
          ),
          FlatButton(
            child: Text('中文'),
            onPressed: (){
              setState(() {
                S.load(Locale('zh', 'CN'));
              });
            },
          ),
          FlatButton(
            child: Text('日文'),
            onPressed: (){
              setState(() {
                S.load(Locale('ja', 'JP'));
              });
            },
          ),
          Text(S.of(context).test),
          FlatButton(
            child: Text('深色模式'),
            onPressed: (){
              Store.value<DarkModeProvider>(context).changeMode(0);
            },
          ),
          FlatButton(
            child: Text('浅色模式'),
            onPressed: (){
              Store.value<DarkModeProvider>(context).changeMode(1);
            },
          ),
          FlatButton(
            child: Text('跟随系统'),
            onPressed: (){
              Store.value<DarkModeProvider>(context).changeMode(2);
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.microtask((){
      _initAsync();
//      showToastDialog('aaaaaaaaa');
//      showToast('bbbbbbbb');
//      Loading.showLoading(context);
//      EasyLoading.show(status: 'loading...');
//      EasyLoading.showProgress(0.3, status: 'downloading...');
//      EasyLoading.showSuccess('Great Success!');
//      EasyLoading.showError('Failed with Error');
//      EasyLoading.showInfo('Useful Information.');
    });

  }
  _initAsync() async {
    int localMode = SpUtil.getInt(Constant.DARK_MODE);
    Store.value<DarkModeProvider>(context).changeMode(localMode);
  }
  @override
  void onCreate() {
    // TODO: implement onCreate
    log("onCreate");
  }

  @override
  void onPause() {
    // TODO: implement onPause
    log("onPause");
  }

  @override
  void onResume() {
    // TODO: implement onResume
    log("onResume");
  }
}