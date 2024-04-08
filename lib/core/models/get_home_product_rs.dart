import 'package:flutter_gru_chang_thai/core/models/base/status_rs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_home_product_rs.g.dart';

@JsonSerializable()
class GetHomeProductRs {
  List<ListHomeProducts>? listHomeProducts;
  StatusRs? status;

  GetHomeProductRs({this.listHomeProducts, this.status});

  factory GetHomeProductRs.fromJson(Map<String, dynamic> json) => _$GetHomeProductRsFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeProductRsToJson(this);

  @override
  String toString() {
    return 'GetHomeProductRs{listHomeProducts: $listHomeProducts, status: $status}';
  }
}

@JsonSerializable()
class ListHomeProducts {
  String? name;
  String? image;

  ListHomeProducts({this.name, this.image});

  factory ListHomeProducts.fromJson(Map<String, dynamic> json) => _$ListHomeProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ListHomeProductsToJson(this);

  @override
  String toString() {
    return 'ListHomeProducts{name: $name, image: $image}';
  }
}
