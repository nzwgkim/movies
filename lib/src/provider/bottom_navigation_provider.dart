import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 0;
  int get currentNavigationIndex => _index;
  void updatePage(int index) {
    _index = index;
    // print('currentPage=$currentPage');
    notifyListeners();
  }
}
