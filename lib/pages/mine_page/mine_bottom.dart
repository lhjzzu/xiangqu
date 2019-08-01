import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MineBottom extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"icon": "assets/images/icn_new_help.png", "title": "新手帮助"},
    {"icon": "assets/images/icn_feedback.png", "title": "意见反馈"},
    {"icon": "assets/images/icn_settings.png", "title": "设置"},
  ];

  List<Widget> _items() {
    int index = -1;
    var widgetList = items.map((item) {
      index++;
      return Column(
        children: <Widget>[
          Container(
              height: ScreenUtil().setHeight(43),
              child: ListTile(
                leading: Image.asset(item["icon"]),
                title: Text(item["title"]),
                trailing: Image.asset("assets/images/icn_list_arrow.png"),
              )),
          Container(
            margin: EdgeInsets.only(left: 10),
            height: index == items.length -1 ? 0:0.5,
            color: Color.fromARGB(255, 205, 204, 208),
          ),
        ],
      );
    }).toList();
    return widgetList;
  }

  MineBottom({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: _items(),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
                width: 0.5, color: Color.fromARGB(255, 205, 204, 208)),
            bottom: BorderSide(
                width: 0.5, color: Color.fromARGB(255, 205, 204, 208)),
          )),
    );
  }
}
