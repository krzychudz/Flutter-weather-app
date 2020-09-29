import 'package:json_annotation/json_annotation.dart';

part 'sys_info.g.dart';

@JsonSerializable()
class SysInfo {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  SysInfo(this.type, this.id, this.country, this.sunrise, this.sunset);

  factory SysInfo.fromJson(Map<String, dynamic> json) =>
      _$SysInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SysInfoToJson(this);
}
