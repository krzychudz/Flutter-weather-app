// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    json['base'] as String,
    json['visibility'] as int,
    json['main'] == null
        ? null
        : WeatherInfo.fromJson(json['main'] as Map<String, dynamic>),
    json['wind'] == null
        ? null
        : Wind.fromJson(json['wind'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'base': instance.base,
      'visibility': instance.visibility,
      'main': instance.main,
      'wind': instance.wind,
    };
