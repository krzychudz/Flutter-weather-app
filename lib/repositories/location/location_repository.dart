import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepository {
  Future<String> getCityNameForCurrentLocation() async {
    Position currentPosition = await getLastKnownPosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);

    return placemarks[0].locality;
  }
}
