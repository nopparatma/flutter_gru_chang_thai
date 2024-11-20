// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories_rs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesRs _$GetCategoriesRsFromJson(Map<String, dynamic> json) =>
    GetCategoriesRs(
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

Map<String, dynamic> _$GetCategoriesRsToJson(GetCategoriesRs instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'pagination': instance.pagination,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'categories': instance.categories,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      categoryId: json['categoryId'] as String?,
      image: json['image'] as String?,
      seq: (json['seq'] as num?)?.toInt(),
      name: json['name'] == null
          ? null
          : BaseI18n.fromJson(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categoryId': instance.categoryId,
      'image': instance.image,
      'seq': instance.seq,
      'name': instance.name,
    };
