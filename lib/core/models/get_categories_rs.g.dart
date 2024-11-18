// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories_rs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesRs _$GetCategoriesRsFromJson(Map<String, dynamic> json) =>
    GetCategoriesRs(
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] == null
          ? null
          : StatusRs.fromJson(json['status'] as Map<String, dynamic>)
      ..pagination = json['pagination'] == null
          ? null
          : PaginationRs.fromJson(json['pagination'] as Map<String, dynamic>);

Map<String, dynamic> _$GetCategoriesRsToJson(GetCategoriesRs instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'pagination': instance.pagination,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };
