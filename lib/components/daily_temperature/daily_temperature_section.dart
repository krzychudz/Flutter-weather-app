import 'package:flutter/material.dart';
import '../../models/daily_weather_response/daily_weather_response.dart';
import '../../repositories/weather/weather_repository.dart';
import '../../extension/extensions.dart';
import 'daily_temperature.dart';

class DailyTemperatureSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder:
          (BuildContext context, AsyncSnapshot<DailyWeatherResponse> snapshot) {
        var tempList =
            snapshot.data.list.map((e) => e.main.feelsLike.formatTemperature());
        print(tempList.toList());
        if (snapshot.connectionState == ConnectionState.done) {
          return DailyTemperature(tempList.toList());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: WeatherRepository().getDailyWeatherByCity("Poznan"),
    );
  }
}
