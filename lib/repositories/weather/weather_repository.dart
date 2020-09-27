import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../keys/secret_loader.dart';
import '../../models/weather/weather.dart';

import 'weater_repository_interface.dart';

class WeatherRepository implements WeatherRepositoryInterface {
  String _apiKey;

  WeatherRepository() {
    SecretLoader(secretPath: "secrets.json")
        .load()
        .then((value) => _apiKey = value.key);
  }

  Future<Weather> getWeatherByCity(String city) async {
    var weatherResponse = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey");
    return Weather.fromJson(jsonDecode(weatherResponse.body));
  }
}
