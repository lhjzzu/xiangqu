import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:xiangqu/model/theme_model.dart';

class HomeProvide  with ChangeNotifier {
  List <ThemeModel> list = [];
  setListModel(List <ThemeModel> list) {
    this.list = list;

    notifyListeners();
  }
  removeAll() {
    list.removeRange(0, list.length);
    notifyListeners();
  }
}