import 'package:json_annotation/json_annotation.dart';
import '../../models/main_weather_info/weather_info.dart';
import '../../models/wind/wind.dart';

part 'daily_weather.g.dart';

@JsonSerializable()
class DailyWeather {
  @JsonKey(name: "dt_txt")
  final String dt;
  final WeatherInfo main;
  final Wind wind;

  DailyWeather(this.dt, this.main, this.wind);
  factory DailyWeather.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$DailyWeatherToJson(this);
}
