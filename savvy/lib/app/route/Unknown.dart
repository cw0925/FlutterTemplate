import 'package:flutter/material.dart';
import 'package:savvy/app/base/BaseWidget.dart';

class UnknownPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    // TODO: implement getState
    return _UnknownPageState();
  }
}

class _UnknownPageState extends BaseWidgetState<UnknownPage> {
  @override
  Widget buildWidget(BuildContext context) {
    return Center(
      child: Text('未知页面'),
    );
  }
  @override
  Widget getAppBarRight() {
    // TODO: implement getAppBarRight
    return null;
  }
  @override
  Widget getAppBarCenter() {
    // TODO: implement getAppBarCenter
    return Text(
      '未知页面',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    );
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