import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String> getLocationCity() async {
  var locationResponse = await getCurrentPosition();
  if (locationResponse == null) return null;
  var cityReponse = await placemarkFromCoordinates(
      locationResponse.latitude, locationResponse.longitude);
  return cityReponse.first.locality;
}
