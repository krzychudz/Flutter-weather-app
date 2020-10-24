import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class CurrentLocation extends StatelessWidget {
  final String cityName;

  CurrentLocation(this.cityName);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      top: 32,
      child: Container(
        child: Row(
          children: [
            Icon(
              Icons.location_pin,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            if (cityName == null)
              Center(
                child: CircularProgressIndicator(),
              )
            else
              Text(
                cityName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
