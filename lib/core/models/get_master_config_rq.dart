import 'package:json_annotation/json_annotation.dart';

part 'get_master_config_rq.g.dart';

@JsonSerializable()
class GetMasterConfigRq {
  Map<String, dynamic> toJson() => _$GetMasterConfigRqToJson(this);
}
