// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_rq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductRq _$GetProductRqFromJson(Map<String, dynamic> json) => GetProductRq(
      categoryId: json['categoryId'] as String?,
      pagination: json['pagination'] == null
          ? null
          : PaginationRq.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProductRqToJson(GetProductRq instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'pagination': instance.pagination,
    };
