import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './mine_page/mine_header.dart';
import './mine_page/mine_middle.dart';
import './mine_page/mine_bottom.dart';
class MinePage extends StatelessWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 240, 240, 240),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            MineHeader(onTap: (){print("点击登录注册");}),
            MineMiddle(),
            MineBottom(),
          ],
        ),
      )
    );
  }
}