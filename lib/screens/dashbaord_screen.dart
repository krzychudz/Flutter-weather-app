import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather/weather.dart';
import '../components/temperature_info/temperaute_info.dart';
import '../enums/temperature_info_type.dart';
import '../repositories/weather/weather_repository.dart';

import '../components/min_max_temperature/min_max_temperature_component.dart';

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
  Weather weatherInfo;

  WeatherInfoSection(this.weatherInfo);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "${weatherInfo.main.temp.toStringAsFixed(1)}\u00B0C",
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
                  temperature:
                      "${weatherInfo.main.tempMin.toStringAsFixed(1)}\u00B0C",
                  isMin: true,
                ),
                MinMaxTemperatureComponent(
                  temperature:
                      "${weatherInfo.main.tempMax.toStringAsFixed(1)}\u00B0C",
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
                  data:
                      "${DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(weatherInfo.sys.sunrise * 1000))}",
                ),
                TemperatureInfo(
                  viewType: TemperatureInfoType.SUNSET,
                  data:
                      "${DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(weatherInfo.sys.sunset * 1000))}",
                ),
                TemperatureInfo(
                  viewType: TemperatureInfoType.DAY_TIME,
                  data:
                      "${DateFormat.H().format(DateTime.fromMillisecondsSinceEpoch(weatherInfo.dt * 1000))}h",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
