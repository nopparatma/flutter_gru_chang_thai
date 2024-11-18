import 'package:json_annotation/json_annotation.dart';

part 'pagination_rs.g.dart';

@JsonSerializable()
class PaginationRs {
  int? totalItems;
  int? totalPages;
  int? currentPage;
  int? limit;

  PaginationRs({this.totalItems, this.totalPages, this.currentPage, this.limit});

  factory PaginationRs.fromJson(Map<String, dynamic> json) => _$PaginationRsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRsToJson(this);
}
