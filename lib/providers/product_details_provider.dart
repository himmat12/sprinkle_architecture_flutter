import 'package:flutter/cupertino.dart';

class ProductDetailsProvider extends ChangeNotifier {
  String _id;
  String _title;
  String _category;

  void addProductTitle(String data) {
    _title = data;
    notifyListeners();
  }

  void addProductId(String data) {
    _id = data;
    notifyListeners();
  }

  void addProductCategory(String data) {
    _category = data;
    notifyListeners();
  }

  String get title => _title;
  String get id => _id;
  String get category => _category;
}
