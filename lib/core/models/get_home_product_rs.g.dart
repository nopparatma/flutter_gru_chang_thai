// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_home_product_rs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeProductRs _$GetHomeProductRsFromJson(Map<String, dynamic> json) =>
    GetHomeProductRs(
      listHomeProducts: (json['listHomeProducts'] as List<dynamic>?)
          ?.map((e) => ListHomeProducts.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] == null
          ? null
          : StatusRs.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetHomeProductRsToJson(GetHomeProductRs instance) =>
    <String, dynamic>{
      'listHomeProducts': instance.listHomeProducts,
      'status': instance.status,
    };

ListHomeProducts _$ListHomeProductsFromJson(Map<String, dynamic> json) =>
    ListHomeProducts(
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ListHomeProductsToJson(ListHomeProducts instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };
