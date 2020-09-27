import 'package:json_annotation/json_annotation.dart';
import '../models/main_weather_info/weather_info.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final String base;
  final int visibility;
  final WeatherInfo main;

  Weather(this.base, this.visibility, this.main);
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
