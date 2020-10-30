import 'package:evaluation_task_flutter/managers/managers.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setUp() {
  sl.registerLazySingleton<ProductManager>(() => ProductManager());
}
