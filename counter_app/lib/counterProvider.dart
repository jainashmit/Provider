import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int getCount() => _count;
  
  void IncreamentCounter() {
    _count++;
    notifyListeners();
  }
}
