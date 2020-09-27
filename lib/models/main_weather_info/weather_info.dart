import 'package:json_annotation/json_annotation.dart';

part 'weather_info.g.dart';

@JsonSerializable()
class WeatherInfo {
  @JsonKey(name: 'feels_like')
  final int feelsLike;
  @JsonKey(name: 'temp_min')
  final int tempMin;
  @JsonKey(name: 'temp_max')
  final int temp;
  final int tempMax;
  final int pressure;
  final int humidity;

  WeatherInfo(this.temp, this.feelsLike, this.tempMin, this.tempMax,
      this.pressure, this.humidity);
  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);
}
