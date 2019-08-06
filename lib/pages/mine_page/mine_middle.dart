import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MineMiddle extends StatelessWidget {
  final List items = [
    {"title": "我的订单", "icon": "assets/images/icn_order_small.png"},
    {"title": "购物车", "icon": "assets/images/icn_cart_small.png"},
    {"title": "我的优惠券", "icon": "assets/images/icn_coupon_small.png"},
    {"title": "喜欢的好物", "icon": "assets/images/icn_fav_small.png"},
    {"title": "设计师入驻", "icon": "assets/images/icn_settle_small.png"},
  ];
  MineMiddle({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Color.fromARGB(255, 221, 221, 221)),
          top: BorderSide(width: 1, color: Color.fromARGB(255, 221, 221, 221)),
        ),
      ),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(0),
      height: ((ScreenUtil().setWidth(375) / 3) * 5 / 9.0) * 2,
      child: GridView.builder(
          padding: EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 3,
              //纵轴间距
              mainAxisSpacing: 0.0,
              //横轴间距
              crossAxisSpacing: 0.0,
              //子组件宽高比例
              childAspectRatio: 9 / 5),
          itemBuilder: (BuildContext context, int index) {
            return _gridViewItem(
                items[index]["title"], items[index]["icon"], index);
          }),
    );
  }

  Widget _gridViewItem(String title, String imageName, int index) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageName,fit: BoxFit.contain,width: 25, height: 25,),
          SizedBox(height: 5,),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),

        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(width: 1, color: Color.fromARGB(255, 221, 221, 221)),
          bottom: BorderSide(width: 1, color: Color.fromARGB(255, 221, 221, 221)),
        ),
      ),
    );
  }
}
