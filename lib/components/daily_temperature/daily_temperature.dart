import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/daily_weather/daily_weather.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../extension/extensions.dart';

class DailyTemperature extends StatelessWidget {
  final List<DailyWeather> temperatures;

  DailyTemperature(this.temperatures);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temperatures[0].dt.convertToDateAsString(
                DateFormat('EEEE, d MMM'),
              ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
            width: double.infinity,
            height: 125,
            child: charts.BarChart(
              _createSampleData(),
              animate: true,
            )),
      ],
    );
  }

  List<charts.Series<WeatherChartData, String>> _createSampleData() {
    final data = temperatures
        .map(
          (weatherData) => WeatherChartData(
              weatherData.dt.convertToDateAsString(DateFormat.Hm()),
              weatherData.main.feelsLike),
        )
        .toList();

    return [
      new charts.Series<WeatherChartData, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
        domainFn: (WeatherChartData data, _) => data.hour,
        measureFn: (WeatherChartData data, _) => data.temp,
        data: data,
      )
    ];
  }
}

class WeatherChartData {
  final String hour;
  final double temp;

  WeatherChartData(this.hour, this.temp);
}
