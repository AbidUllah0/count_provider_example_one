import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int count = 10;

  //getter
  int get _count => count;

//setter
  void setCount() {
    count++;
    notifyListeners();
  }
}
