// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_master_data_rs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMasterDataRs _$GetMasterDataRsFromJson(Map<String, dynamic> json) =>
    GetMasterDataRs(
      getMasterData: json['getMasterData'] == null
          ? null
          : GetMasterData.fromJson(
              json['getMasterData'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : StatusRs.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMasterDataRsToJson(GetMasterDataRs instance) =>
    <String, dynamic>{
      'getMasterData': instance.getMasterData,
      'status': instance.status,
    };

GetMasterData _$GetMasterDataFromJson(Map<String, dynamic> json) =>
    GetMasterData(
      listMasterData: (json['listMasterData'] as List<dynamic>?)
          ?.map((e) => ListMasterData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMasterDataToJson(GetMasterData instance) =>
    <String, dynamic>{
      'listMasterData': instance.listMasterData,
    };

ListMasterData _$ListMasterDataFromJson(Map<String, dynamic> json) =>
    ListMasterData(
      key: json['key'] as String?,
      name: json['name'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$ListMasterDataToJson(ListMasterData instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'data': instance.data,
    };
