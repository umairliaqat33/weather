import 'package:geolocator/geolocator.dart';

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
    Location location = Location();
    Position position = await location.getCurrentLocation();
    double latitude = position.latitude;
    double longitude = position.longitude;
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${latitude}&lon=${longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
