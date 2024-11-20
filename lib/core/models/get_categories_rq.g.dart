// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories_rq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesRq _$GetCategoriesRqFromJson(Map<String, dynamic> json) =>
    GetCategoriesRq(
      pagination: json['pagination'] == null
          ? null
          : PaginationRq.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCategoriesRqToJson(GetCategoriesRq instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };
