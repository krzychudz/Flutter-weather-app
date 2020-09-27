import 'package:json_annotation/json_annotation.dart';

part 'weather_info.g.dart';

@JsonSerializable()
class WeatherInfo {
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double temp;
  final double tempMax;
  final double pressure;
  final double humidity;

  WeatherInfo(this.temp, this.feelsLike, this.tempMin, this.tempMax,
      this.pressure, this.humidity);
  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);
}
