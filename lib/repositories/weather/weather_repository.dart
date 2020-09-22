import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

import 'weater_repository_interface.dart';

class WeatherRepository implements WeatherRepositoryInterface {
  String api_key = "ca81d4bc0c7285556a9a2daaa5e6d466";

  Future<Weather> getWeatherByCity(String city) async {
    var weatherResponse = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api_key");
    return Weather.fromJson(jsonDecode(weatherResponse.body));
  }
}
