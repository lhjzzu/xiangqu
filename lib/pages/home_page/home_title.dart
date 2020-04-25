import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './app_bar.dart';

class HomeTitle {
  static PreferredSizeWidget builder() {
    return _homeAppBar();
  }
 static Widget _homeAppBarFirstLine() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 1.0,
      width: ScreenUtil().setWidth(100.0),
      decoration: new BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 237, 237, 237),
          Color.fromARGB(255, 222, 222, 222),
        ]),
      ),
    );
  }

  static Widget _homeAppBarSecondLine() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 1.0,
      width: ScreenUtil().setWidth(100.0),
      decoration: new BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 222, 222, 222),
          Color.fromARGB(255, 237, 237, 237),
        ]),
      ),
    );
  }

 static PreferredSizeWidget _homeAppBar() {
    return HomeAppBar(
      child: Container(
          padding: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _homeAppBarFirstLine(),
              Text("专题2", style: TextStyle(fontSize: 25)),
              _homeAppBarSecondLine(),
            ],
          )),
    );
  }
}
