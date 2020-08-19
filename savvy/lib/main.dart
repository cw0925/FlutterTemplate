import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:savvy/app/provider/DarkMode.dart';
import 'package:savvy/app/provider/Store.dart';
import 'app/route/Router.dart';
import 'app/utils/SpUtil.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
  //初始化本地存储
  SpUtil.getInstance();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: Store.init(
          context: context,
          child: Consumer<DarkModeProvider>(
            builder: (context,darkModeProvider,_){
              return darkModeProvider.darkMode == 2?MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
//supportedLocales: S.delegate.supportedLocales,
// 设置中文为首选项
                supportedLocales: (<Locale>[const Locale('zh', ''), ])..addAll(S.delegate.supportedLocales),
                debugShowCheckedModeBanner: false,  //去除右上角的Debug标签
//        title: 'Flutter Demo',
// 获取翻译文案的内容需要在能获取到上下文的前提下才能生效，也就是说只能对MaterialApp
// 的子组件才会生效，所以下面的方法设置动态Title是不行的，需要使用回调方法onGenerateTitle
//title: S.of(context).app_name,
                onGenerateTitle: (context) => S.of(context).app_name,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                darkTheme: ThemeData.dark(),
                routes: Router.routes,
                initialRoute: Router.main,
                onGenerateRoute: Router.generateRoute,
                onUnknownRoute: Router.unknownRoute,
              ):MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
//supportedLocales: S.delegate.supportedLocales,
// 设置中文为首选项
                supportedLocales: (<Locale>[const Locale('zh', ''), ])..addAll(S.delegate.supportedLocales),
                debugShowCheckedModeBanner: false,  //去除右上角的Debug标签
//        title: 'Flutter Demo',
// 获取翻译文案的内容需要在能获取到上下文的前提下才能生效，也就是说只能对MaterialApp
// 的子组件才会生效，所以下面的方法设置动态Title是不行的，需要使用回调方法onGenerateTitle
//title: S.of(context).app_name,
                onGenerateTitle: (context) => S.of(context).app_name,
                theme: darkModeProvider.darkMode == 1?ThemeData.dark():ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                routes: Router.routes,
                initialRoute: Router.main,
                onGenerateRoute: Router.generateRoute,
                onUnknownRoute: Router.unknownRoute,
              );
            },
          )
      ),
    );
  }
}

