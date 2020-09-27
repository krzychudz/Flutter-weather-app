import 'package:json_annotation/json_annotation.dart';
import '../main_weather_info/weather_info.dart';
import '../wind/wind.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final String base;
  final int visibility;
  final WeatherInfo main;
  final Wind wind;

  Weather(this.base, this.visibility, this.main, this.wind);
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
