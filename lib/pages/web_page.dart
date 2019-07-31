import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class WebPage extends StatelessWidget {
  final  url;
  WebPage({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.url !=null? this.url:"",
      appBar: AppBar(
        title: Text("详情页"),
      ),
    );
  }
}