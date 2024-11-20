// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_rq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationRq _$PaginationRqFromJson(Map<String, dynamic> json) => PaginationRq(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationRqToJson(PaginationRq instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
