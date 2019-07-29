import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';

class URL {
  static const baseUrl = "http://api.xiangqu.com/";
  static const topic = "ios/topic";
  static getUrl(String path) {
    return baseUrl + topic;
  }
}

class Network {
  static _commondio() {
    var dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    return dio;
  }

  static topics() async {
    var dio = Network._commondio();
    var formData = {
      "key": "867a43ce96837773ecdbecfdb96aa3ed",
      "t": DateTime.now().millisecondsSinceEpoch
    };
    var responseData = await dio.post(URL.getUrl(URL.topic), data: formData);
    if ((responseData is Map) && responseData["data"] != null) {}
    print("responseData" + responseData.toString());
  }

  static Future topics2() async {
    var dio = Network._commondio();
    var formData = {
      "key": "867a43ce96837773ecdbecfdb96aa3ed",
      "t": DateTime.now().millisecondsSinceEpoch
    };
    try {
      var responseData = await dio.post(URL.getUrl(URL.topic), data: formData);
      if ((responseData is Map) && responseData["data"] != null) {
        print("responseData" + responseData.toString());
        return responseData["data"];
      }
    } catch (err) {
      
    }
  }
}
