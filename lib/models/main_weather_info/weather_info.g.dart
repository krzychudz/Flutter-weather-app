// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) {
  return WeatherInfo(
    (json['temp_max'] as num)?.toDouble(),
    (json['feels_like'] as num)?.toDouble(),
    (json['temp_min'] as num)?.toDouble(),
    (json['tempMax'] as num)?.toDouble(),
    (json['pressure'] as num)?.toDouble(),
    (json['humidity'] as num)?.toDouble(),
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
