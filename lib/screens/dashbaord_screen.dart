import 'package:flutter/material.dart';
import 'package:weather_app/components/daily_temperature/daily_temperature.dart';
import 'package:weather_app/components/daily_temperature/daily_temperature_section.dart';
import 'package:weather_app/models/weather/weather.dart';
import '../components/temperature_info/temperaute_info.dart';
import '../enums/temperature_info_type.dart';
import '../repositories/weather/weather_repository.dart';

import '../components/min_max_temperature/min_max_temperature_component.dart';

import '../extension/extensions.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/landscape_vector.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              height: screenHeight * (6 / 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(25, 0, 0, 0),
                    offset: Offset(0.0, -2.0),
                    blurRadius: 4.0,
                  ),
                ],
                color: Color.fromARGB(240, 255, 255, 255),
              ),
              child: FutureBuilder<Weather>(
                future: WeatherRepository().getWeatherByCity("Poznan"),
                builder:
                    (BuildContext context, AsyncSnapshot<Weather> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return WeatherInfoSection(snapshot.data);
                },
              )),
        ),
      ),
    );
  }
}

class WeatherInfoSection extends StatelessWidget {
  final Weather weatherInfo;

  WeatherInfoSection(this.weatherInfo);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              weatherInfo.main.temp.formatTemperature(),
              style: TextStyle(
                fontSize: 64,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MinMaxTemperatureComponent(
                  temperature: weatherInfo.main.tempMin.formatTemperature(),
                  isMin: true,
                ),
                MinMaxTemperatureComponent(
                  temperature: weatherInfo.main.tempMax.formatTemperature(),
                  isMin: false,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TemperatureInfo(
                  viewType: TemperatureInfoType.PREASURE,
                  data: "${weatherInfo.main.pressure.toStringAsFixed(0)} hPa",
                ),
                TemperatureInfo(
                  viewType: TemperatureInfoType.HUMIDITY,
                  data: "${weatherInfo.main.humidity.toStringAsFixed(0)}%",
                ),
                TemperatureInfo(
                  viewType: TemperatureInfoType.WIND,
                  data: "${weatherInfo.wind.speed.toStringAsFixed(0)} km/h",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TemperatureInfo(
                  viewType: TemperatureInfoType.SUNRISE,
                  data: weatherInfo.sys.sunrise.convertToDateAsString(),
                ),
                TemperatureInfo(
                  viewType: TemperatureInfoType.SUNSET,
                  data: weatherInfo.sys.sunset.convertToDateAsString(),
                ),
                TemperatureInfo(
                  viewType: TemperatureInfoType.DAY_TIME,
                  data: "${weatherInfo.dt.convertToDateAsString()}h",
                ),
              ],
            ),
            DailyTemperatureSection(),
          ],
        ),
      ),
    );
  }
}
