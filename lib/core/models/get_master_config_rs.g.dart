// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_master_config_rs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMasterConfigRs _$GetMasterConfigRsFromJson(Map<String, dynamic> json) =>
    GetMasterConfigRs(
      status: json['status'] == null
          ? null
          : StatusRs.fromJson(json['status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMasterConfigRsToJson(GetMasterConfigRs instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      masterConfigs: (json['masterConfigs'] as List<dynamic>?)
          ?.map((e) => MasterConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'masterConfigs': instance.masterConfigs,
    };

MasterConfig _$MasterConfigFromJson(Map<String, dynamic> json) => MasterConfig(
      key: json['key'] as String?,
      name: json['name'] as String?,
      value: json['value'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$MasterConfigToJson(MasterConfig instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'value': instance.value,
      'status': instance.status,
    };
