import 'package:evaluation_task_flutter/models/models.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider extends ChangeNotifier {
  int _count = 0;
  List<ProductModel> _productsList = [];

  void addToWishlist(ProductModel product) {
    _productsList.map((e) => e.id.compareTo(product.id));
    notifyListeners();
  }

  void removeFromWishlist(int id) {
    _productsList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  int get count {
    _count = _productsList.length;
    notifyListeners();
    return _count;
  }

  List<ProductModel> get productList => _productsList;
}
