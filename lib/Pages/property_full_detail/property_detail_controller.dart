import 'package:flutter/material.dart';

class PropertyDetailController with ChangeNotifier {
  int _currentPage = 1;
  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;

  int get currentPage => _currentPage;

  void updatePage(int pageIndex) {
    _currentPage = pageIndex;
    notifyListeners();
  }

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}
