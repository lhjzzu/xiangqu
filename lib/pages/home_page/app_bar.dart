import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget implements  PreferredSizeWidget{

  final Widget child;
  HomeAppBar({@required this.child}) : assert(child != null);

  @override
  Size get preferredSize => Size.fromHeight(56);

  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: widget.child,
    );
  }
}