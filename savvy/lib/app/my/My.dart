import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:savvy/app/base/BaseWidget.dart';
import 'package:savvy/app/route/Router.dart';

class MyPage extends BaseWidget {
  MyPage(Object arguments);
  @override
  BaseWidgetState<BaseWidget> getState() {
    // TODO: implement getState
    return _MyPageState();
  }
}

class _MyPageState extends BaseWidgetState<MyPage> {
  List data = [
    {'icon': 'assets/images/order.png', 'title': '我的资料'},
    {'icon': 'assets/images/wallet.png', 'title': '支付中心'},
  ];
  String name = '';
  String phone = '';
  String icon = '';
  bool is_zmcertified = false;
  @override
  Widget buildWidget(BuildContext context) {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Container(
          color: Colors.green,
          child: ListView.builder(
              itemBuilder: (BuildContext context, int position) {
                return buildItemWidget(context, position);
              },
              itemCount: data.length + 1),
        ));
  }

  Widget buildItemWidget(BuildContext context, int index) {
    if (index == 0) {
      return _headerWidget(context, index);
    } else {
      return _itemBuildWidget(context, index);
    }
  }

//  头部
  Widget _headerWidget(BuildContext context, int index) {
    return new GestureDetector(
      child: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.only(left: 20, bottom: 20),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ClipOval(
                    child: Image.asset('assets/images/default.png', width: 80, height: 80),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
//                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name,style: TextStyle(fontSize: ScreenUtil().setSp(20)),),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(phone),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Image.asset('assets/images/default.png', height: 20,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset('assets/images/default.png', width: 50, height: 50),
                ],
              ),
            ],
          )),
      onTap: () {
        print('header click $index --------------------');
        Navigator.of(context).pushNamed(Router.myInfoPage);
      },
    );
  }

//  cell
  Widget _itemBuildWidget(BuildContext context, int index) {
    return new GestureDetector(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(data[index - 1]['icon'], width: 20, height: 20),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(data[index - 1]['title']),
            )),
            Image.asset('assets/images/next.png', width: 50, height: 50),
          ],
        ),
      ),
      onTap: () {
        print('click $index --------------------');
        if (index == 1) {
          Navigator.of(context).pushNamed(Router.myInfoPage);
        } else if (index == 2) {
          Navigator.of(context).pushNamed(Router.payPage);
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setAppBarTitle('个人中心');
  }


  @override
  Widget getAppBarRight() {
    // TODO: implement getAppBarRight
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(Router.settingPage);
        },
        child: Image.asset('assets/images/more.png', width: 50, height: 50));
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
