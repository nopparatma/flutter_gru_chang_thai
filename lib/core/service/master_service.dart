import 'package:flutter_gru_chang_thai/core/models/get_master_data_rq.dart';
import 'package:flutter_gru_chang_thai/core/models/get_master_data_rs.dart';

import 'base_service.dart';

class MasterService extends BaseService {
  static const String controllerName = 'master';

  Future<GetMasterDataRs> getMasterData(GetMasterDataRq rq) async {
    return await post(
      getApiUrl(controllerName, 'getMasterData'),
      rq.toJson(),
      (data) => GetMasterDataRs.fromJson(data),
    );
  }
}
