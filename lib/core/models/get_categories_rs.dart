import 'package:flutter_gru_chang_thai/core/models/base/pagination_rs.dart';
import 'package:flutter_gru_chang_thai/core/models/base/status_rs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_categories_rs.g.dart';

@JsonSerializable()
class GetCategoriesRs {
  Data? data;
  StatusRs? status;
  PaginationRs? pagination;

  GetCategoriesRs(this.data);

  factory GetCategoriesRs.fromJson(Map<String, dynamic> json) => _$GetCategoriesRsFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesRsToJson(this);
}

@JsonSerializable()
class Data {
  final String name;
  final String description;

  Data({required this.name, required this.description});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
