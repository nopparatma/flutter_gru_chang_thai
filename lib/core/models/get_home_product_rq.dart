import 'package:json_annotation/json_annotation.dart';

part 'get_home_product_rq.g.dart';

@JsonSerializable()
class GetHomeProductRq {
  Map<String, dynamic> toJson() => _$GetHomeProductRqToJson(this);
}
