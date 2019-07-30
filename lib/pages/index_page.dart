import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:xiangqu/provide/index_provide.dart';
import './home_page.dart';
import './designer_page.dart';
import './shopping_page.dart';
import './mine_page.dart';

class IndexPath extends StatelessWidget {
  // final items = [
  //   BottomNavigationBarItem(
  //     icon: Image.asset("images/2.0x/icn_guang_highlight.png", fit: BoxFit.cover, width: 25,height: 25,),
  //     title: Text("专题"),
  //   ),
  //   BottomNavigationBarItem(
  //     icon:  Icon(Icons.home),
  //     title: Text("设计师"),
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.home),
  //     title: Text("逛"),
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.home),
  //     title: Text("我的"),
  //   ),
  // ];

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
      normalImageName = "images/icn_zhuanti.png";
      selectedImageName = "images/icn_zhuanti_highlight.png";
    } else if (index == 1) {
      normalImageName = "images/icn_designer.png";
      selectedImageName = "images/icn_designer_highlight.png";
    } else if (index == 2) {
      normalImageName = "images/icn_guang.png";
      selectedImageName = "images/icn_guang_highlight.png";
    } else if (index == 3) {
      normalImageName = "images/icn_mycenter.png";
      selectedImageName = "images/icn_mycenter_highlight.png";
    } 
    return BottomNavigationBarItem(
                icon: Container(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:  AssetImage(currentIndex != index ? normalImageName:selectedImageName),
                      )
                    ),
                  ),
                  width: 25,
                  height: 25,
                ),
                title: Text(title),
              );
  }


  @override
  Widget build(BuildContext context) {

    
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
