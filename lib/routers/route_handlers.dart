import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/web_page.dart';
var webviewHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String url = params["url"]?.first;
    return WebPage(url: url);
  }
);