import 'package:json_annotation/json_annotation.dart';

part 'get_master_data_rq.g.dart';

@JsonSerializable()
class GetMasterDataRq {
  Map<String, dynamic> toJson() => _$GetMasterDataRqToJson(this);
}
