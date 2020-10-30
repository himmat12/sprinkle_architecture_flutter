import 'package:evaluation_task_flutter/models/models.dart';
import 'package:evaluation_task_flutter/services/products_service.dart';

class ProductManager {
  Stream<List<ProductModel>> productStream() =>
      Stream.fromFuture(ProductService().getProducts());
}
