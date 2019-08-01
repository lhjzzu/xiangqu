import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:xiangqu/provide/index_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './home_page.dart';
import './designer_page.dart';
import './shopping_page.dart';
import './mine_page.dart';

class IndexPath extends StatelessWidget {
  final pages = [
    HomePage(),
    DesignerPage(),
    ShoppingPage(),
    MinePage(),
  ];
  IndexPath({Key key}) : super(key: key);

  BottomNavigationBarItem _bottomItem(String title, int index ,int currentIndex) {
    var normalImageName = "";
    var selectedImageName = "";
    if (index == 0) {
      normalImageName = "assets/images/icn_zhuanti.png";
      selectedImageName = "assets/images/icn_zhuanti_highlight.png";
    } else if (index == 1) {
      normalImageName = "assets/images/icn_designer.png";
      selectedImageName = "assets/images/icn_designer_highlight.png";
    } else if (index == 2) {
      normalImageName = "assets/images/icn_guang.png";
      selectedImageName = "assets/images/icn_guang_highlight.png";
    } else if (index == 3) {
      normalImageName = "assets/images/icn_mycenter.png";
      selectedImageName = "assets/images/icn_mycenter_highlight.png";
    } 
    return BottomNavigationBarItem(
                icon: Container(
                  child: Image.asset(currentIndex != index ? normalImageName:selectedImageName),
                  width: 25,
                  height: 25,
          ),
         title: Text(title),
      );
  }


  @override
  Widget build(BuildContext context) {
   //初始化screenUtil
   ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);

    return Provide<IndexProvide>(
      builder: (BuildContext context, Widget child, IndexProvide indexProvide) {
        return Scaffold(
          body: IndexedStack(
            children: pages,
            index: indexProvide.currentIndex,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              _bottomItem("专题", 0,indexProvide.currentIndex),
              _bottomItem("设计师", 1,indexProvide.currentIndex),
              _bottomItem("逛", 2,indexProvide.currentIndex),
              _bottomItem("我的", 3,indexProvide.currentIndex),              
            ],
            selectedItemColor: Color.fromARGB(255, 212, 183, 104),
            unselectedItemColor: Colors.black,
            currentIndex: indexProvide.currentIndex,
            onTap: (index) {
              indexProvide.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
