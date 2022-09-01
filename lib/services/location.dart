import 'package:geolocator/geolocator.dart';

class Location {

  Future getCurrentLocation() async {
    try {
      Geolocator.requestPermission();
      Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      return position;
    } catch (e) {
      print(e);
    }
  }
}