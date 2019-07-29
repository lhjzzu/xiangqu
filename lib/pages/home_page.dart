import 'package:flutter/material.dart';
import '../network/network.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getTopics();
    return Scaffold(
      body: Center(
        child: Text('HomePage'),
      ),
    );
  }

  getTopics() {
    print("开始网路请求");
    Network.topics();
  }
}