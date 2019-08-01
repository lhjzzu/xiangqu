import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../network/network.dart';
import '../model/theme_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provide/home_provide.dart';
import './home_page/home_title.dart';
import './home_page/home_swiper.dart';
import 'dart:core';
import '../routers/routes.dart';
class HomePage extends StatelessWidget {

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LinearGradient(colors: [Colors.amberAccent, Colors.lightBlue, Colors.red]);
    return Scaffold(
      appBar: HomeTitle.builder(),
      body: Container(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(15),
            bottom: ScreenUtil().setHeight(35)),
        child: FutureBuilder(
          future: getTopics(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Provide<HomeProvide>(
                builder: (context, child, homeProvide) {
                  return HomeSwiper(
                    onTap: (index) {
                      var model = homeProvide.list[index];
                      print("image" + model.image);
                      var url = model.url;
                      if (url == null || url.length == 0) {
                        return;
                      }
                      //暂时用百度替代链接
                      url = "https://www.baidu.com";
                      Routes.navigateTo(context, Routes.webview, {"url":url}, transition:TransitionType.native );
                    },
                  );
                },
              );
            } else {
              return Center(
                child: Text('加载中...'),
              );
            }
          },
        ),
      ),
    );
  }

  Future getTopics(BuildContext context) async {
    var result = await Network.topics();
    if (result["data"] != null) {
      var listModel = ThemeListModel.fromJson(result);
      Provide.value<HomeProvide>(context).setListModel(listModel.data);
    }
    return "end";
  }
}
