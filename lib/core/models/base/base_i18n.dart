import 'package:json_annotation/json_annotation.dart';

part 'base_i18n.g.dart';

@JsonSerializable()
class BaseI18n {
  String? th;
  String? en;

  BaseI18n({
    this.th,
    this.en,
  });

  factory BaseI18n.fromJson(Map<String, dynamic> json) => _$BaseI18nFromJson(json);

  Map<String, dynamic> toJson() => _$BaseI18nToJson(this);
}
