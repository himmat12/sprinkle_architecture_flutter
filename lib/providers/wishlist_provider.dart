import 'package:evaluation_task_flutter/models/models.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider extends ChangeNotifier {
  int _count = 0;
  List<ProductModel> _productsList = [];

  void addToWishlist(ProductModel product) {
    // if (_productsList.isEmpty) {
    //   _productsList.add(product);
    // } else {
    //   _productsList.forEach((element) {
    //     if (element.id != product.id) {
    //       _productsList.add(product);
    //     }
    //   });

    _productsList.add(product);
    // ProductModel data;
    // data = _productsList.last;

    // if (_productsList.isEmpty) {
    //   _productsList.add(product);
    // }

    // if (_productsList.length > 0) {
    //   if (data.id != product.id) {
    //     _productsList.add(product);
    //   }
    // }
  }

  notifyListeners();

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
