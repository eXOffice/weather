import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude, longitude;

  Future<void> getLocation() async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      //Position? position = await Geolocator.getLastKnownPosition();
      Position? position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      longitude = position?.longitude;
      latitude = position?.latitude;
    } catch (e) {
      print(e);
    }
  }
}
