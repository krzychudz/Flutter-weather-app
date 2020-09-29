// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeatherResponse _$DailyWeatherResponseFromJson(Map<String, dynamic> json) {
  return DailyWeatherResponse(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : DailyWeather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DailyWeatherResponseToJson(
        DailyWeatherResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
