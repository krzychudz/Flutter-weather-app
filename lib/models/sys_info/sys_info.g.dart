// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SysInfo _$SysInfoFromJson(Map<String, dynamic> json) {
  return SysInfo(
    json['type'] as int,
    json['id'] as int,
    json['country'] as String,
    json['sunrise'] as int,
    json['sunset'] as int,
  );
}

Map<String, dynamic> _$SysInfoToJson(SysInfo instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
