import 'package:flutter_gru_chang_thai/core/models/base/base_i18n.dart';
import 'package:flutter_gru_chang_thai/core/models/base/pagination_rs.dart';
import 'package:flutter_gru_chang_thai/core/models/base/status_rs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_categories_rs.g.dart';

@JsonSerializable()
class GetCategoriesRs {
  Data? data;
  StatusRs? status;
  PaginationRs? pagination;

  GetCategoriesRs({this.data, this.status, this.pagination});

  factory GetCategoriesRs.fromJson(Map<String, dynamic> json) => _$GetCategoriesRsFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesRsToJson(this);
}

@JsonSerializable()
class Data {
  List<Category>? categories;

  Data({this.categories});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Category {
  String? categoryId;
  String? image;
  int? seq;
  BaseI18n? name;

  Category({
    this.categoryId,
    this.image,
    this.seq,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}