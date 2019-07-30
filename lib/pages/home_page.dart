import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../network/network.dart';
import '../model/theme_model.dart';
import './home_page/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../provide/swiper_index_provide.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  Widget _swiper(BuildContext context) {
    final _controller = new SwiperController();
    final _customLayoutOption =
      new CustomLayoutOption(startIndex: -1, stateCount: 3)
            .addRotate([-25.0 / 180, 0.0, 25.0 / 180]).addTranslate([
      new Offset(-350.0, 0.0),
      new Offset(0.0, 0.0),
      new Offset(350.0, 0.0)
    ]);
    return Swiper(
      onTap: (int index) {
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("New page"),
            ),
            body: Container(),
          );
        }));
      },
      customLayoutOption: _customLayoutOption,
      fade: 1,
      index: Provide.value<SwiperIndexProvide>(context).currentIndex,
      onIndexChanged: (int index) {
        Provide.value<SwiperIndexProvide>(context).changeIndex(index);
      },
      curve: Curves.ease,
      scale: 0.8,
      itemWidth: 300.0,
      controller: _controller,
      layout: SwiperLayout.DEFAULT,
      outer: false,
      itemHeight: 200.0,
      viewportFraction: 0.8,
      autoplayDelay: 3000,
      loop: false,
      autoplay: false,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.green,
          child: Center(
            child: Text("$index"),
          ),
        );
      },
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      autoplayDisableOnInteraction: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    LinearGradient(colors: [Colors.amberAccent, Colors.lightBlue, Colors.red]);
    // getTopics();
    return Scaffold(
      appBar: _homeAppBar(),
      body: Container(
        color: Colors.red,
        child: Provide<SwiperIndexProvide>(
          builder: (context, child, swiperIndexProvide) {
            return _swiper(context);
          },
        ),
      ),
    );
  }

  getTopics() async {
    print("开始网路请求");
    var result = await Network.topics();
    if (result["data"] != null) {
      var listModel = ThemeListModel.fromJson(result);
      print("listModel ${listModel.toJson()}");
    }
  }

  Widget _homeAppBarFirstLine() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 1.0,
      width: ScreenUtil().setWidth(200.0),
      decoration: new BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 237, 237, 237),
          Color.fromARGB(255, 222, 222, 222),
        ]),
      ),
    );
  }

  Widget _homeAppBarSecondLine() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 1.0,
      width: ScreenUtil().setWidth(200.0),
      decoration: new BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 222, 222, 222),
          Color.fromARGB(255, 237, 237, 237),
        ]),
      ),
    );
  }

  Widget _homeAppBar() {
    return HomeAppBar(
      child: Container(
          padding: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _homeAppBarFirstLine(),
              Text("专题", style: TextStyle(fontSize: 25)),
              _homeAppBarSecondLine(),
            ],
          )),
    );
  }
}
