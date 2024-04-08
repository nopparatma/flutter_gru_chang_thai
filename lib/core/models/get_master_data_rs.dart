import 'package:flutter/widgets.dart';
import 'package:flutter_gru_chang_thai/core/models/base/status_rs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_master_data_rs.g.dart';

@JsonSerializable()
class GetMasterDataRs {
  GetMasterData? getMasterData;
  StatusRs? status;

  GetMasterDataRs({this.getMasterData, this.status});

  factory GetMasterDataRs.fromJson(Map<String, dynamic> json) => _$GetMasterDataRsFromJson(json);

  Map<String, dynamic> toJson() => _$GetMasterDataRsToJson(this);

  @override
  String toString() {
    return 'GetMasterDataRs{getMasterData: $getMasterData, status: $status}';
  }
}

@JsonSerializable()
class GetMasterData {
  List<ListMasterData>? listMasterData;

  GetMasterData({this.listMasterData});

  factory GetMasterData.fromJson(Map<String, dynamic> json) => _$GetMasterDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetMasterDataToJson(this);

  @override
  String toString() {
    return 'GetMasterData{listMasterData: $listMasterData}';
  }
}

@JsonSerializable()
class ListMasterData {
  String? key;
  String? name;
  String? data;

  ListMasterData({this.key, this.name, this.data});

  factory ListMasterData.fromJson(Map<String, dynamic> json) => _$ListMasterDataFromJson(json);

  Map<String, dynamic> toJson() => _$ListMasterDataToJson(this);

  @override
  String toString() {
    return 'ListMasterData{key: $key, name: $name, data: $data}';
  }
}
