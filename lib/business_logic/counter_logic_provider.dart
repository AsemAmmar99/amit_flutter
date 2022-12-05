import 'package:flutter/material.dart';

class CounterLogicProvider with ChangeNotifier{
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }

}