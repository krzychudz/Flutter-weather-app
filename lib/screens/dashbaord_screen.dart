import 'package:flutter/material.dart';
import 'package:weather_app/repositories/weather/weather_repository.dart';

import '../components/min_max_temperature/min_max_temperature_component.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    WeatherRepository rep = WeatherRepository();
    rep.getWeatherByCity("Poznan").then((value) => print(value.main.feelsLike));

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
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "55",
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
                        temperature: "25",
                        isMin: true,
                      ),
                      MinMaxTemperatureComponent(
                        temperature: "25",
                        isMin: false,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
