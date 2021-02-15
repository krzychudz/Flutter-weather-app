import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import '../../repositories/location/location_repository.dart';

class CurrentLocation extends StatelessWidget {
  final Map<String, double> locationData;

  CurrentLocation({this.locationData});

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
            FutureBuilder<String>(
              future: LocationRepository().getCityNameForCurrentLocation(),
              builder: (context, placeSnapshot) {
                if (!placeSnapshot.hasData)
                  return CircularProgressIndicator();
                else
                  return Text(
                    placeSnapshot.data,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
