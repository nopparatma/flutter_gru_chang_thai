// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_rs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationRs _$PaginationRsFromJson(Map<String, dynamic> json) => PaginationRs(
      totalItems: (json['totalItems'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationRsToJson(PaginationRs instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'limit': instance.limit,
    };
