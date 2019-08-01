import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../routers/routes.dart';
class WebPage extends StatelessWidget {
  final  url;
  WebPage({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: WebviewScaffold(
      appBar: AppBar(
        leading: Container(
          width: 50,
          height: 44,
          child: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){
                Routes.pop(context);
              },
         )
        ),
        title: Text("详情页"),
      ),
      url: this.url !=null? this.url:"",
    ),
    );
  }
}