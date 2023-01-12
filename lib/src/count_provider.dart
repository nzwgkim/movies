import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier {
  int _counter;
  int get count => _counter;

  void add() {
    _counter++;
    notifyListeners();
  }

  void remove() {
    _counter--;
    notifyListeners();
  }
}
