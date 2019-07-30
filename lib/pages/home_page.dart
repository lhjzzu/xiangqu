import 'package:flutter/material.dart';
import '../network/network.dart';
import '../model/theme_model.dart';
import 'dart:ui';
class HomePage extends StatelessWidget {


   HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getTopics();
    return Scaffold(
      appBar: AppBar(
        title: Text('想去'),
      ),
      body: Center(
        child: Text('HomePage'),
      ),
    );
  }

  getTopics()  async {
    print("开始网路请求");
    var result =  await  Network.topics();
    if (result["data"] != null) {
      var  listModel = ThemeListModel.fromJson(result);
      print("listModel ${listModel.toJson()}");
    }
  }
}