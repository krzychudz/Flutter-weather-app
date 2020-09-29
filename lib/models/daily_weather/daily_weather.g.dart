// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeather _$DailyWeatherFromJson(Map<String, dynamic> json) {
  return DailyWeather(
    json['dt_txt'] as String,
    json['main'] == null
        ? null
        : WeatherInfo.fromJson(json['main'] as Map<String, dynamic>),
    json['wind'] == null
        ? null
        : Wind.fromJson(json['wind'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DailyWeatherToJson(DailyWeather instance) =>
    <String, dynamic>{
      'dt_txt': instance.dt,
      'main': instance.main,
      'wind': instance.wind,
    };
