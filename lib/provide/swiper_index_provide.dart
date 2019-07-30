import 'package:flutter/widgets.dart';
class SwiperIndexProvide  with ChangeNotifier{
  int currentIndex = 0;
  changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}