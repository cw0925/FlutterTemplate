///
/// @author cw
/// @time   2020/7/17
///
import 'package:provider/provider.dart';
import 'package:savvy/app/provider/DarkMode.dart';
import 'UserModel.dart';

class Store {
  static init({context, child}) {
    //多个Provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=>DarkModeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context)=>UserModel(),
        ),
      ],
      child: child,
    );
  }
  //获取值 of(context)  这个会引起页面的整体刷新，如果全局是页面级别的
  static T value<T>(context) {
    return Provider.of<T>(context,listen: false);
  }
  // 不会引起页面的刷新，只刷新了 Consumer 的部分，极大地缩小你的控件刷新范围
  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }

}

//使用示例
//Store.connect<UserInfo>(builder: (ctx, user, child) {
//return Text(user.name);
//}),
//这个会引起整个页面重新build
// RaisedButton(
//   child: Text("修改数据"),
//   onPressed: () {
//     Store.value<UserInfo>(context).setName("234");
//   },
// ),