import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:xiangqu/provide/index_provide.dart';
import './home_page.dart';
import './designer_page.dart';
import './shopping_page.dart';
import './mine_page.dart';

class IndexPath extends StatelessWidget {
  final items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("专题"),
    ),
    BottomNavigationBarItem(
      icon:  Icon(Icons.home),
      title: Text("设计师"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("逛"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("我的"),
    ),
  ];

  final pages = [
    HomePage(),
    DesignerPage(),
    ShoppingPage(),
    MinePage(),
  ];
  IndexPath({Key key}) : super(key: key);

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
            items: items,
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
