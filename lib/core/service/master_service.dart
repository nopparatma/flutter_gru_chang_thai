import 'package:flutter_gru_chang_thai/core/models/get_master_config_rq.dart';
import 'package:flutter_gru_chang_thai/core/models/get_master_config_rs.dart';

import 'base_service.dart';

class MasterService extends BaseService {
  static const String version = 'v1';
  static const String controllerName = '$version/master';

  Future<GetMasterConfigRs> getMasterConfig(GetMasterConfigRq rq) async {
    return await post(
      getApiUrl(controllerName, 'getMasterConfig'),
      rq.toJson(),
      (data) => GetMasterConfigRs.fromJson(data),
    );
  }
}
