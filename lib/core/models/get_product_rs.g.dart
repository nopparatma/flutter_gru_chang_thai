// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_rs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductRs _$GetProductRsFromJson(Map<String, dynamic> json) => GetProductRs(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : StatusRs.fromJson(json['status'] as Map<String, dynamic>),
      pagination: json['pagination'] == null
          ? null
          : PaginationRs.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProductRsToJson(GetProductRs instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'pagination': instance.pagination,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      categoryId: json['categoryId'] as String?,
      image: json['image'] as String?,
      sku: json['sku'] as String?,
      name: json['name'] == null
          ? null
          : BaseI18n.fromJson(json['name'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : BaseI18n.fromJson(json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'categoryId': instance.categoryId,
      'image': instance.image,
      'sku': instance.sku,
      'name': instance.name,
      'description': instance.description,
    };
