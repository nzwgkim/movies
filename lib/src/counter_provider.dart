import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void add() {
    _counter++;
    print('count=$counter, _count=$_counter');
    notifyListeners();
  }

  void remove() {
    _counter--;
    notifyListeners();
  }
}
