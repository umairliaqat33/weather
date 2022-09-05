import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'location.dart';
import 'networking.dart';

const apiKey = '73e2a6c55130ee059d26ef54383edb7a';

class WeatherModel {
  String openWeatherMapURL;

  WeatherModel(this.openWeatherMapURL);

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getAQILocationWeather(
      double latitude, double longitude) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${latitude}&lon=${longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    double latitude = 31.582045;
    double longitude = 74.329376;
    if (PermissionStatus == PermissionStatus.denied) {
      print("permission denied");
      NetworkHelper networkHelper = NetworkHelper(
          '$openWeatherMapURL?lat=${latitude}&lon=${longitude}&appid=$apiKey&units=metric');
      var weatherData = await networkHelper.getData();
      return weatherData;
    } else {
      Location location = Location();
      Position position = await location.getCurrentLocation();
      latitude = position.latitude;
      longitude = position.longitude;

      NetworkHelper networkHelper = NetworkHelper(
          '$openWeatherMapURL?lat=${latitude}&lon=${longitude}&appid=$apiKey&units=metric');

      var weatherData = await networkHelper.getData();
      return weatherData;
    }
  }
}
