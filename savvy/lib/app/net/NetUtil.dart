import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class NetUtil {
  static final debug = true;
  static BuildContext context = null;

  static final host = 'https://api.youyoutingche.com';
  static final baseUrl = host + '/ytapi/';

  // ignore: argument_type_not_assignable
  static final Dio _dio = new Dio(new BaseOptions(
      method: "get",
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      followRedirects: true));

  /// 代理设置，方便抓包来进行接口调节
  static void setProxy() {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      // config the http client
      client.findProxy = (uri) {
        //proxy all request to localhost:8888
        return "PROXY 10.66.0.73:8888";
      };
      // you can also create a new HttpClient to dio
      // return new HttpClient();
    };
  }

  static String token;

  static final LogicError unknowError = LogicError(-1, "未知异常");

  static Future<Map<String, dynamic>> getJson<T>(
      String uri, Map<String, dynamic> paras) =>
      _httpJson("get", uri, data: paras).then(logicalErrorTransform);

  static Future<Map<String, dynamic>> getForm<T>(
      String uri, Map<String, dynamic> paras) =>
      _httpJson("get", uri, data: paras, dataIsJson: false)
          .then(logicalErrorTransform);

  /// 表单方式的post
  static Future<Map<String, dynamic>> postForm<T>(
      String uri, Map<String, dynamic> paras) =>
      _httpJson("post", uri,data: paras, dataIsJson: false)
          .then(logicalErrorTransform);

  /// requestBody (json格式参数) 方式的 post
  static Future<Map<String, dynamic>> postJson(
      String uri, Map<String, dynamic> body) =>
      _httpJson("post", uri, data: body).then(logicalErrorTransform);

  static Future<Map<String, dynamic>> deleteJson<T>(
      String uri,Map<String, dynamic> body) =>
      _httpJson("delete", uri, data: body).then(logicalErrorTransform);

  /// requestBody (json格式参数) 方式的 put
  static Future<Map<String, dynamic>> putJson<T>(
      String uri, Map<String, dynamic> body) =>
      _httpJson("put", uri, data: body).then(logicalErrorTransform);

  /// 表单方式的 put
  static Future<Map<String, dynamic>> putForm<T>(
      String uri, Map<String, dynamic> body) =>
      _httpJson("put", uri, data: body, dataIsJson: false)
          .then(logicalErrorTransform);

  /// 文件上传  返回json数据为字符串
  static Future<T> putFile<T>(String uri, String filePath) async {
    var name = filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length);
//    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
//    FormData formData = new FormData.from({
//      "multipartFile": new UploadFileInfo(new File(filePath), name,
//          contentType: ContentType.parse("image/$suffix"))
//    });
    FormData formData = FormData.fromMap({
      "multipartFile": await MultipartFile.fromFile(filePath, filename: name),
    });
    var enToken = token == null ? "" : Uri.encodeFull(token);
    return _dio
        .put<Map<String, dynamic>>("$uri?token=$enToken", data: formData)
        .then(logicalErrorTransform);
  }


  static Future<Response> _httpJson(
      String method, String uri,
      {Map<String, dynamic> data, bool dataIsJson = true}) async{
    /// 如果为 get方法，则进行参数拼接
    if (method == "get") {
      dataIsJson = false;
      if (data == null) {
        data = new Map<String, dynamic>();
      }else{
        data.forEach((key, value) {
          uri = uri + '&$key=' + value.toString();
          print('URI='+uri);
        });
      }
    }
    if (debug) {
      print('<net url>------$baseUrl$uri');
      print('<net params>------$data');
    }
    /// 根据当前 请求的类型来设置 如果是请求体形式则使用json格式
    /// 否则则是表单形式的（拼接在url上）
    Options op;
//    if (dataIsJson) {
//      op = new Options(contentType: Headers.jsonContentType);
//    } else {
//      op = new Options(contentType: Headers.formUrlEncodedContentType);
//    }
//    op = new Options(contentType: Headers.jsonContentType);
    op = new Options(contentType: Headers.formUrlEncodedContentType);
    op.method = method;
    if(debug){
//      setProxy();
    }
    /// 统一带上token
    return _dio.request(
        uri,
        data: data,
        options: op);
  }
  /// 对请求返回的数据进行统一的处理
  /// 如果成功则将我们需要的数据返回出去，否则进异常处理方法，返回异常信息
  static Future<T> logicalErrorTransform<T>(Response resp) {
    if (debug) {
      print('resp--------$resp');
      print('resp.data--------${resp.data}');
    }
    LogicError error;
    if (resp != null) {
      var parsedJson = json.decode(resp.data);
      if (parsedJson["code"] == '1000' || parsedJson["code"] == 1000 || parsedJson["code"] == 1009 || parsedJson["code"] == '1009') {
        T realData = parsedJson as T;
        return Future.value(realData);
      }else{
        print(parsedJson["code"].toString());
        int errCode = int.parse(parsedJson["code"]);
        error = new LogicError(errCode, parsedJson["msg"]);
//        ToastUtils.showToast(parsedJson["msg"]);
      }
    }else {
      error = unknowError;
    }
    return Future.error(error);
  }
}

class LogicError {
  int errorCode;
  String msg;

  LogicError(errorCode, msg) {
    this.errorCode = errorCode;
    this.msg = msg;
  }
}

enum PostType { json, form, file }
