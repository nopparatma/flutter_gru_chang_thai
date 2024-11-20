import 'package:flutter_gru_chang_thai/core/models/base/pagination_rq.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_categories_rq.g.dart';

@JsonSerializable()
class GetCategoriesRq {
  PaginationRq? pagination;

  GetCategoriesRq({this.pagination});

  factory GetCategoriesRq.fromJson(Map<String, dynamic> json) => _$GetCategoriesRqFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesRqToJson(this);
}
