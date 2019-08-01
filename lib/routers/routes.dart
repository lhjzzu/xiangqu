import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {

  static Router _router; 
  static String webview = "/webview";
  static void configureRoutes(Router router) {
    _router = router;
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!! $params");
      return Text("");
    });
    //配置webview
    router.define(webview, handler: webviewHandler);
  }

  static navigateTo(BuildContext context, String path, Map<String, dynamic> params, {TransitionType transition}) {
    String query =  "";
    int index = 0;
    for (var key in params.keys) {
      var value = Uri.encodeComponent(params[key]);
      if (index == 0) {
        query = "?";
      } else {
        query = query + "\$";
      }
      query += "$key=$value";
      index++;
    }
    path = path + query;
    _router.navigateTo(context, path, transition:transition);
  }

  static pop(BuildContext context) {
    _router.pop(context);
  }

}