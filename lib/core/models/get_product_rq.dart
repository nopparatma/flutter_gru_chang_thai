import 'package:flutter_gru_chang_thai/core/models/base/pagination_rq.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_product_rq.g.dart';

@JsonSerializable()
class GetProductRq {
  String? categoryId;
  PaginationRq? pagination;

  GetProductRq({this.categoryId, this.pagination});

  factory GetProductRq.fromJson(Map<String, dynamic> json) => _$GetProductRqFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductRqToJson(this);
}
