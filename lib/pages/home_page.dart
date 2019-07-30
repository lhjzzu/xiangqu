import 'package:flutter/material.dart';
import '../network/network.dart';
import '../model/theme_model.dart';
import './home_page/app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LinearGradient(colors: [Colors.amberAccent, Colors.lightBlue, Colors.red]);
    // getTopics();
    return Scaffold(
      appBar: _homeAppBar(),
      body: Center(
        child: Text('HomePage'),
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
      width: 100.0,
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
      width: 100.0,
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
              Text("专题",style: TextStyle(fontSize: 25),),
              _homeAppBarSecondLine(),
            ],
          )),
    );
  }
}
