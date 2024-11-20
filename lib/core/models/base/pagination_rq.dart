import 'package:json_annotation/json_annotation.dart';

part 'pagination_rq.g.dart';

@JsonSerializable()
class PaginationRq {
  int? page;
  int? limit;

  PaginationRq({this.page, this.limit});

  factory PaginationRq.fromJson(Map<String, dynamic> json) => _$PaginationRqFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRqToJson(this);
}
