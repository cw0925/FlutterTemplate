import 'package:flutter/material.dart';
import 'package:savvy/app/home/Home.dart';
import 'package:savvy/app/my/My.dart';
import 'package:savvy/app/splash/Splash.dart';

import 'Unknown.dart';

class Router {

  static final main = 'main';
  static final appPage = 'app';
  static final myPage = 'my';
  static final homePage = 'home';
  static final myInfoPage = 'myInfo';
  static final loginPage = 'login';
  static final newsPage = 'news';
  static final feedbackPage = 'feedback';
  static final settingPage = 'setting';
  static final payPage = 'pay';
  static final aboutPage = 'about';
  static final agreementPage = 'agreement';
  static final uploadPage = 'upload';
  static final bindPage = 'bind';

  static final modifyEmailPage = 'email';
  static final modifyNamePage = 'name';
  static final modifyNickNamePage = 'nick';
  static final modifyPhonePage = 'phone';
  static final modifySexPage = 'sex';

  static final scorePage = 'score';

  static final Map<String, WidgetBuilder> routes = {
    main: (ctx) => SplashPage(),
//    appPage: (ctx){
//      return HomePage();
//    },
    homePage: (ctx) => HomePage(),
//    loginPage: (ctx) => LoginPage(),
//    newsPage: (ctx) => NewsPage(),
//    feedbackPage: (ctx) => FeedbackPage(),
//    settingPage: (ctx) => SettingPage(),
//    myInfoPage: (ctx) => MyInfoPage(),
//    payPage: (ctx) => PayCenterPage(),
//    aboutPage: (ctx) => AboutPage(),
//    agreementPage: (ctx) => AgreementPage(),
//    uploadPage: (ctx) => UploadPage(),
//    bindPage: (ctx) => BindPhonePage(),
//
//    modifyEmailPage: (ctx) => ModifyEmailPage(),
//    modifyNamePage: (ctx) => ModifyNamePage(),
//    modifyNickNamePage: (ctx) => ModifyNickNamePage(),
//    modifyPhonePage: (ctx) => ModifyPhonePage(),
//    modifySexPage: (ctx) => ModifySexPage(),
//
//    scorePage: (ctx) => ScorePage()
  };


  static final RouteFactory generateRoute = (settings) {
    if (settings.name == myPage) {
      return MaterialPageRoute(
          builder: (ctx) {
            return MyPage(settings.arguments);
          }
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(
        builder: (ctx) {
          return UnknownPage();
        }
    );
  };
}