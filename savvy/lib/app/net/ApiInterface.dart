import 'NetUtil.dart';
import 'ErrorHandler.dart';

/// 所有接口请求

class ApiInterface {
  /// 获取验证码
  static final String _API_GET_CODE = 'smscode.php?type=smscode';
  static Future<Map<String, dynamic>> getCodeRequest(
      String phone) async {
    return NetUtil.postJson(_API_GET_CODE,{"phone": phone});
  }
  /// 手机号登录
  static final String _API_PHONE_LOGIN = 'login.php?type=userLogin';
  static Future<Map<String, dynamic>> phoneLoginRequest(
      String phone,String code,String msgID) async {
    return NetUtil.postJson(_API_PHONE_LOGIN,{"phone": phone,"smscode": code,"msgid": msgID});
  }
  ///获取支付宝签名
  static final String _API_ALIPAY_SIGN = 'login.php?type=alipaySign';
  static Future<Map<String, dynamic>> getAlipaySignRequest() async {
    return NetUtil.getJson(_API_ALIPAY_SIGN,{});
  }
  ///支付宝登录
  static final String _API_ALIPAY_LOGIN = 'login.php?type=alipayLogin';
  static Future<Map<String, dynamic>> getAlipayLoginRequest( String code,String userid) async {
    return NetUtil.postJson(_API_ALIPAY_LOGIN,{"auth_code":code,"user_id":userid});
  }
  ///获取支付宝签名
  static final String _API_USER_INFO = 'user.php?type=getUserInfo';
  static Future<Map<String, dynamic>> getUserInfoRequest(
      String openid) async {
    return NetUtil.getJson(_API_USER_INFO,{"openid": openid});
  }
  ///苹果登录
  static final String _API_APPLE_LOGIN = 'login.php?type=appleLogin';
  static Future<Map<String, dynamic>> appleLoginRequest(
      String token,String name) async {
    return NetUtil.postJson(_API_APPLE_LOGIN,{"identityToken": token,"nickname": name});
  }
  ///获取地图标注
  static final String _API_MARKS = 'tmpdata.php';
  static Future<Map<String, dynamic>> getMarkersRequest(
      String latii,String longg) async {
    return NetUtil.postJson(_API_MARKS,{"latii": latii,"longg": longg});
  }
}
