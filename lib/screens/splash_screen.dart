import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/dashbaord_screen.dart';
import '../constants/routes/routes.dart' as Routes;

class SplashScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(
        const Duration(milliseconds: 2000),
        () => checkPremissionAndRedirectToProperScreen(context),
      );
    });

    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text("Splash Screen"),
        ),
      ),
    );
  }

  Future<void> checkPremissionAndRedirectToProperScreen(
      BuildContext context) async {
    var permissionData = await checkPermission();
    if (permissionData == LocationPermission.denied) {
      var locationPermission = await requestLocationPermission();
      if (locationPermission) {
        openDashboardScreen(context);
      } else {
        // TODO Go to location chooser screen
      }
    } else {
      openDashboardScreen(context);
    }
  }

  Future<bool> requestLocationPermission() async {
    var permissionResult = await requestPermission();
    return permissionResult == LocationPermission.always ||
        permissionResult == LocationPermission.whileInUse;
  }

  void openDashboardScreen(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.routeDashboard);
  }
}
