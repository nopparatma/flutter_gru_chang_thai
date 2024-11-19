import 'package:flutter_gru_chang_thai/core/models/base/status_rs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_master_config_rs.g.dart';

@JsonSerializable()
class GetMasterConfigRs {
  StatusRs? status;
  Data? data;

  GetMasterConfigRs({
    this.status,
    this.data,
  });

  factory GetMasterConfigRs.fromJson(Map<String, dynamic> json) => _$GetMasterConfigRsFromJson(json);

  Map<String, dynamic> toJson() => _$GetMasterConfigRsToJson(this);

  @override
  String toString() {
    return 'GetMasterConfigRs{status: $status, data: $data}';
  }
}

@JsonSerializable()
class Data {
  List<MasterConfig>? masterConfigs;

  Data({
    this.masterConfigs,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString() {
    return 'Data{masterConfigs: $masterConfigs}';
  }
}

@JsonSerializable()
class MasterConfig {
  String? key;
  String? name;
  String? value;
  String? status;

  MasterConfig({
    this.key,
    this.name,
    this.value,
    this.status,
  });

  factory MasterConfig.fromJson(Map<String, dynamic> json) => _$MasterConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MasterConfigToJson(this);

  @override
  String toString() {
    return 'MasterConfig{key: $key, name: $name, value: $value, status: $status}';
  }
}
