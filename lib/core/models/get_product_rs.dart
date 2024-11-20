import 'package:flutter_gru_chang_thai/core/models/base/base_i18n.dart';
import 'package:flutter_gru_chang_thai/core/models/base/pagination_rs.dart';
import 'package:flutter_gru_chang_thai/core/models/base/status_rs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_product_rs.g.dart';

@JsonSerializable()
class GetProductRs {
  Data? data;
  StatusRs? status;
  PaginationRs? pagination;

  GetProductRs({
    this.data,
    this.status,
    this.pagination,
  });

  factory GetProductRs.fromJson(Map<String, dynamic> json) => _$GetProductRsFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductRsToJson(this);
}

@JsonSerializable()
class Data {
  List<Product>? products;

  Data({
    this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Product {
  String? categoryId;
  String? image;
  String? sku;
  BaseI18n? name;
  BaseI18n? description;

  Product({
    this.categoryId,
    this.image,
    this.sku,
    this.name,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
