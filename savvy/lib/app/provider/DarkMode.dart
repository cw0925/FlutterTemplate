import 'package:flutter/material.dart';
import 'package:savvy/app/common/Constant.dart';
import 'package:savvy/app/utils/SpUtil.dart';

///
///  DarkModePage.Dart
///  savvy
///
///  Created by CW on 2020/8/14.
///  Copyright © 2020 wx. All rights reserved.
///
class DarkModeProvider with ChangeNotifier {
  /// 深色模式 0: 关闭 1: 开启 2: 随系统
  int _darkMode;
  int get darkMode => _darkMode;
  void changeMode(int darkMode) async {
    _darkMode = darkMode;
    notifyListeners();
    SpUtil.putInt(Constant.DARK_MODE, darkMode);
  }

}