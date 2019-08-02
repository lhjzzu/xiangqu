import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef void MineHeaderTap();
class MineHeader extends StatelessWidget {

  final MineHeaderTap onTap;

  MineHeader({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(280),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/user_img_bg.png"),
            fit: BoxFit.cover),
      ),
      child: Stack(
        textDirection: TextDirection.rtl,
        children: <Widget>[
          _message(),
          _loginOrRegister(), 
          _followAndFans()
        ],
      ),
    );
  }

  Widget _message() {
    return Positioned(
      child: Image.asset(
        "assets/images/icn_msg_white.png",
        fit: BoxFit.cover,
      ),
      top: ScreenUtil().setHeight(40),
      right: 15,
      width: 24,
      height: 24,
    );
  }

  Widget _loginOrRegister() {
    return Positioned(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              "在这里，找到属于你的不一样",
              style: TextStyle(
                  color: Color.fromARGB(255, 200, 200, 200), fontSize: 17),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: InkWell(
                onTap: () {
                  if (this.onTap != null) {
                    this.onTap();
                  }
                },
                child: Text(
                  "登录/注册",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 200, 200, 200), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
      top: ScreenUtil().setHeight(90),
      left: 0,
      right: 0,
      height: ScreenUtil().setHeight(100),
    );
  }

  Widget _followAndFans() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        height: ScreenUtil().setHeight(40),
        child: Container(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _followAndFansItem("关注",0),
              _columnLine(),
              _followAndFansItem("粉丝",0),
            ],
          ),
        ));
  }
  
  Widget _columnLine() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      color: Color.fromARGB(255, 200, 200, 200),
      width: 1,
      height: 25,
    );
  }


  Widget _followAndFansItem(String title, int count){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("$count", style: TextStyle(color: Colors.white, fontSize: 12)),
        Text("$title",style: TextStyle(color: Color.fromARGB(255, 200, 200, 200), fontSize: 12))
      ],

    );
  }
}
