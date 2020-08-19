/// @author cw
/// @time   2020/7/17
///
import 'package:flutter/material.dart';
import 'package:savvy/app/utils/SpUtil.dart';

class UserModel with ChangeNotifier {
  ///登录状态
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  void setLogin(login){
    SpUtil.putBool('isLogin', login);
    if(!login){//退出登录
      SpUtil.remove('openid');
    }
    _isLogin = login;
    notifyListeners();
  }

}