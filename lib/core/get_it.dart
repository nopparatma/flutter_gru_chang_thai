import 'package:flutter_gru_chang_thai/core/service/master_service.dart';
import 'package:flutter_gru_chang_thai/core/service/product_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  GetIt.instance.registerLazySingleton(() => ProductService());
  GetIt.instance.registerLazySingleton(() => MasterService());
}
