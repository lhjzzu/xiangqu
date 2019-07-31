import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  static _request(String method, String path, {Map data}) async {
    var dio = Network._commondio();
    var result = Map<String, dynamic>();

    try {
      var responseData;
      if (method == "get") {
        var response = await dio.get(URL.getUrl(path));
        responseData = response.data;
      } else if (method == "post") {
        var response = await dio.post(URL.getUrl(path), data: data);
        responseData = response.data;
      }
      // print("responseData" + responseData.toString());
      if ((responseData is Map) &&
        responseData["code"] == 200 &&
        responseData["data"] != null) {
        result["data"] = responseData["data"];
        result["error"] = null;
        result["code"] = responseData["code"];
      } else {
        result["data"] = null;
        result["error"] = responseData["msg"];
        result["code"] = responseData["code"];
        if (result["error"] != null) {
          Fluttertoast.showToast(
              msg: result["error"],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    } catch (err) {
      result["data"] = null;
      result["error"] = err.message;
      result["code"] = (err.response as Response).statusCode;
    }
    // print("result $result");
    return result;
  }


  /**
   *  专题
   */
  static Future<Map<String, dynamic>> topics() async {
    var formData = {
      "key": "867a43ce96837773ecdbecfdb96aa3ed",
      "t": DateTime.now().millisecondsSinceEpoch
    };
    return await _request('post', URL.topic, data: formData);
  }
}
