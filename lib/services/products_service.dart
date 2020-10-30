import 'package:evaluation_task_flutter/models/models.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class ProductService {
  String url;
  List data = [];
  var response;

  Iterable<ProductModel> productList = [];

  Future<List<ProductModel>> getProducts() async {
    url = await rootBundle.loadString("../products.json");
    data = json.decode(url);
    productList = data.map((e) => ProductModel.fromJson(e)).toList();
    return productList;
  }
}
