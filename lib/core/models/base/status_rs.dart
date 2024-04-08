import 'package:json_annotation/json_annotation.dart';

part 'status_rs.g.dart';

@JsonSerializable()
class StatusRs {
  String? code;
  String? message;

  StatusRs({this.code, this.message});

  factory StatusRs.fromJson(Map<String, dynamic> json) => _$StatusRsFromJson(json);

  Map<String, dynamic> toJson() => _$StatusRsToJson(this);

  @override
  String toString() {
    return 'StatusRs{code: $code, message: $message}';
  }
}
