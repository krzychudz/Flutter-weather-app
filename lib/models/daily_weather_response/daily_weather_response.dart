import 'package:json_annotation/json_annotation.dart';
import '../../models/daily_weather/daily_weather.dart';

part 'daily_weather_response.g.dart';

@JsonSerializable()
class DailyWeatherResponse {
  final List<DailyWeather> list;

  DailyWeatherResponse(this.list);

  factory DailyWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DailyWeatherResponseToJson(this);
}
