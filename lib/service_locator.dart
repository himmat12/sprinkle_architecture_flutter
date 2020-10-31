import 'package:evaluation_task_flutter/managers/managers.dart';
import 'package:evaluation_task_flutter/services/products_service.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setUp() {
  // managers
  sl.registerLazySingleton<ProductManager>(() => ProductManager());

  // services
  sl.registerLazySingleton<ProductService>(() => ProductService());
}
