import 'package:flutter/material.dart';

List languages = [
  'English',
  'Spanish',
];
List langCode = [
  'en',
  'es',
];

class SingleNotifier extends ChangeNotifier {
  String _currentlanguage = languages[0];
  SingleNotifier();
  String get currentlanguage => _currentlanguage;
  updatelanguage(String value) {
    if (value != _currentlanguage) {
      _currentlanguage = value;
      notifyListeners();
    }
  }
}
