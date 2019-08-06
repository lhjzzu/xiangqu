import 'package:flutter/material.dart';
import 'package:xiangqu/model/recommend_designer_model.dart';
import 'package:xiangqu/model/deginer_category_model.dart';

class DesignerProvide with ChangeNotifier {
  RecommendDesignerModel recommendModel;
  DesignerCategoryDataModel categoryDataModel;
  int selectedIndex = 0;

  setRecommendModel(RecommendDesignerModel recommendModel) {
    this.recommendModel = recommendModel;
    notifyListeners();
  }

  setCategoryDataModel(DesignerCategoryDataModel categoryDataModel) {
    this.categoryDataModel = categoryDataModel;
    notifyListeners();
  }

  setSelectedIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }

}