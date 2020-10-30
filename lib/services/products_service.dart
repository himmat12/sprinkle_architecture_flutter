import 'package:evaluation_task_flutter/models/models.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class ProductService {
  String url;
  List data = [];
  var response;

  Iterable<ProductModel> productList = [];

  Future<List<ProductModel>> getProducts({String category}) async {
    url = await rootBundle.loadString("assets/products.json");
    data = json.decode(url);
    productList = data.map((e) => ProductModel.fromJson(e)).toList();

    if (category.isNotEmpty || category != null) {
      productList = productList
          .where((element) => element.category.contains(category))
          .toList();
    }
    return productList;
  }
}
