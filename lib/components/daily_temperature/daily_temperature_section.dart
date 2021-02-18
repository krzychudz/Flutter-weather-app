import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/daily_weather/daily_weather.dart';
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
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [...buildDailyTemperatureWidgets(snapshot.data)],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: WeatherRepository().getDailyWeatherByCity(),
    );
  }

  List<Widget> buildDailyTemperatureWidgets(
      DailyWeatherResponse dailyWeatherResponse) {
    List<Widget> finalList = [];
    List<DailyWeather> weatherByDay = [];

    for (int i = 0; i < dailyWeatherResponse.list.length; i++) {
      try {
        var currentDayFormatted = dailyWeatherResponse.list[i].dt
            .convertToDateAsString(DateFormat.yMd());

        var dayAfterFormatted = dailyWeatherResponse.list[i + 1].dt
            .convertToDateAsString(DateFormat.yMd());

        weatherByDay.add(dailyWeatherResponse.list[i]);

        if (currentDayFormatted != dayAfterFormatted) {
          if (weatherByDay.length > 2) {
            finalList.add(DailyTemperature(weatherByDay));
            finalList.add(
              SizedBox(
                height: 10,
              ),
            );
          }
          weatherByDay = [];
        }
      } catch (arrayBoundException) {
        weatherByDay.add(dailyWeatherResponse.list[i]);
        if (weatherByDay.length > 2) {
          finalList.add(DailyTemperature(weatherByDay));
          finalList.add(
            SizedBox(
              height: 10,
            ),
          );
        }
      }
    }
    return finalList;
  }
}
