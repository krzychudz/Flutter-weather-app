import 'package:flutter/material.dart';
import 'package:weather_app/enums/temperature_info_type.dart';

class TemperatureInfo extends StatelessWidget {
  TemperatureInfoType viewType;
  String data;

  TemperatureInfo({this.viewType, this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(getAssetPath()),
          Text(
            getLabel(),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            data,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String getAssetPath() {
    String assetUrl;
    switch (viewType) {
      case TemperatureInfoType.PREASURE:
        assetUrl = "assets/images/wi-barometer.png";
        break;
      case TemperatureInfoType.HUMIDITY:
        assetUrl = "assets/images/wi-humidity.png";
        break;
      case TemperatureInfoType.WIND:
        assetUrl = "assets/images/wi-strong-wind.png";
        break;
      case TemperatureInfoType.SUNRISE:
        assetUrl = "assets/images/time_low.png";
        break;
      case TemperatureInfoType.SUNSET:
        assetUrl = "assets/images/time_high.png";
        break;
      case TemperatureInfoType.DAY_TIME:
        assetUrl = "assets/images/total_time.png";
        break;
    }
    return assetUrl;
  }

  String getLabel() {
    String label;
    switch (viewType) {
      case TemperatureInfoType.PREASURE:
        label = "Preasure";
        break;
      case TemperatureInfoType.HUMIDITY:
        label = "Humidity";
        break;
      case TemperatureInfoType.WIND:
        label = "Wind";
        break;
      case TemperatureInfoType.SUNRISE:
        label = "Sunrise";
        break;
      case TemperatureInfoType.SUNSET:
        label = "Sunset";
        break;
      case TemperatureInfoType.DAY_TIME:
        label = "Day time";
        break;
    }
    return label;
  }
}
