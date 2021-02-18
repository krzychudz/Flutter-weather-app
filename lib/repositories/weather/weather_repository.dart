import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../models/daily_weather_response/daily_weather_response.dart';
import '../../keys/secret_loader.dart';
import '../../models/weather/weather.dart';
import '../location/location_repository.dart';

class WeatherRepository {
  String _apiKey;

  WeatherRepository() {
    SecretLoader(secretPath: "secrets.json")
        .load()
        .then((value) => _apiKey = value.key);
  }

  Future<Weather> getWeatherByCity() async {
    var city = await LocationRepository().getCityNameForCurrentLocation();
    var weatherResponse = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$_apiKey");
    return Weather.fromJson(jsonDecode(weatherResponse.body));
  }

  Future<DailyWeatherResponse> getDailyWeatherByCity() async {
    var city = await LocationRepository().getCityNameForCurrentLocation();
    var dailyWeatherResponse = await http.get(
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&units=metric&appid=$_apiKey");
    return DailyWeatherResponse.fromJson(jsonDecode(dailyWeatherResponse.body));
  }
}
