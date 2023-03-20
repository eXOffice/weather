import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude, longitude;

  Future<void> getLocation() async {
    try {
      print('from location class');
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      //Position? position = await Geolocator.getLastKnownPosition();
      Position? position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      print('from location class 2');
      // print(position?.latitude);
      // print(position?.longitude);

      longitude = position?.longitude;
      latitude = position?.latitude;
    } catch (e) {
      print(e);
    }
  }

// void somethingHappen(int n) {
//   if (n > 10) {
//     throw 'its would be lower than TEN';
//   }
// }
}
