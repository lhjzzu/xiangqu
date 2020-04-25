import 'package:flutter/foundation.dart';

//mixins
class IndexProvide with ChangeNotifier {
  
  int currentIndex = 0;
  changeIndex(int index) {
    this.currentIndex = index;
    notifyListeners();
  }

}