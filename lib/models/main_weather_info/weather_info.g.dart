// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) {
  return WeatherInfo(
    json['temp_max'] as int,
    json['feels_like'] as int,
    json['temp_min'] as int,
    json['tempMax'] as int,
    json['pressure'] as int,
    json['humidity'] as int,
  );
}

Map<String, dynamic> _$WeatherInfoToJson(WeatherInfo instance) =>
    <String, dynamic>{
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.temp,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
