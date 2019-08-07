import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/common_util.dart';
class DesignerHeader extends StatelessWidget {
  final String imageUrl;
  final String shopName;
  final String userNick;
  final String opTag;
  final String tagstr;

  DesignerHeader(
      {Key key,
      this.imageUrl,
      this.shopName,
      this.userNick,
      this.opTag,
      this.tagstr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(250),
      child: Stack(
        children: <Widget>[
          _backgroundImage(),
          _linearGradient(),
          _name(),
          _opTag(),
          _tagStr(),
        ],
      ),
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  Widget _backgroundImage() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Image.network(noNullValue(imageUrl, ""), fit: BoxFit.cover),
    );
  }

  Widget _tagStr() {
    return Positioned(
      left: 15,
      bottom: 15,
      child: Container(
        child: Text(
          noNullValue(tagstr, ""),
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }

  Widget _opTag() {
    return Positioned(
      left: 15,
      bottom: 40,
      child: Container(
        child: Text(
          noNullValue(opTag, ""),
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  Widget _name() {
    return Positioned(
      left: 15,
      bottom: 60,
      child: Container(
        child: Text(
          userNick != null && shopName != null ? "$userNick | $shopName":"",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  Widget _linearGradient() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          height: 150,
          decoration: new BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(0, 0, 0, 0),
              Color.fromARGB(80, 0, 0, 0),
              Color.fromARGB(0, 0, 0, 0)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter,stops: [0,0.8,1]),
          ),
        ));
  }
}
