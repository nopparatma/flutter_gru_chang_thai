import 'package:flutter_gru_chang_thai/core/models/get_home_product_rq.dart';
import 'package:flutter_gru_chang_thai/core/models/get_home_product_rs.dart';

import 'base_service.dart';

class ProductService extends BaseService {
  static const String controllerName = 'product';

  Future<GetHomeProductRs> getHomeProduct(GetHomeProductRq rq) async {
    return await post(
      getApiUrl(controllerName, 'getHomeProduct'),
      rq.toJson(),
      (data) => GetHomeProductRs.fromJson(data),
    );
  }
}
