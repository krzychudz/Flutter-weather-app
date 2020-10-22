import 'package:flutter/material.dart';
import 'package:weather_app/screens/splash_screen.dart';

import './screens/dashbaord_screen.dart';
import 'package:geolocator/geolocator.dart';

import 'constants/routes/routes.dart' as Routes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Barlow',
      ),
      home: SplashScreen(),
      routes: {
        Routes.routeDashboard: (context) => DashboardScreen(),
      },
    );
  }
}
