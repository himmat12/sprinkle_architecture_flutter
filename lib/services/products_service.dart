import 'package:evaluation_task_flutter/models/models.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class ProductService {
  String url;
  List data = [];
  var response;

  List<ProductModel> productList = [];

  Future<List<ProductModel>> getProducts({String category, String id}) async {
    url = await rootBundle.loadString("assets/products.json");
    data = json.decode(url);
    productList = data.map((e) => ProductModel.fromJson(e)).toList();

    if (category != null) {
      productList = productList
          .where((element) => element.category.contains(category))
          .toList();
    }
    if (id != null) {
      productList = productList
          .where((element) => element.id.toString().contains(id))
          .toList();
    }
    return productList;
  }
}
