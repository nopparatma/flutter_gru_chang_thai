import 'package:flutter_gru_chang_thai/core/models/get_product_rq.dart';
import 'package:flutter_gru_chang_thai/core/models/get_product_rs.dart';

import 'base_service.dart';

class ProductService extends BaseService {
  static const String version = 'v1';
  static const String controllerName = '$version/product';

  Future<GetProductRs> getProduct(GetProductRq rq) async {
    return await post(
      getApiUrl(controllerName, 'getProduct'),
      rq.toJson(),
      (data) => GetProductRs.fromJson(data),
    );
  }
}
