import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  String _category;

  void addCategory(String data) {
    _category = data;
    notifyListeners();
  }

  String get category => _category;
}
