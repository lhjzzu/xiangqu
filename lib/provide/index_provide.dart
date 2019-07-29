import 'package:flutter/foundation.dart';

class IndexProvide with ChangeNotifier {
  
  int currentIndex = 0;
  changeIndex(int index) {
    this.currentIndex = index;
    notifyListeners();
  }

}