import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:weather/cards/atmosphere_quality.dart';
import 'package:weather/services/constants.dart';
import 'package:weather/services/weather_model.dart';
import 'package:weather/screens/five_day_forecast.dart';
import '../widgets/day_forecast.dart';
import '../widgets/hourly_forecast.dart';
import 'package:weather/cards/air_quality.dart';
import 'package:weather/widgets/aqi.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 0;
  double width = 0;
  bool isCity = false;
  double lat = 0;
  double lon = 0;
  var weatherData;
  final weatherFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var weatherDataAqi;
  int temperature = 0;
  double feel = 0;
  String weatherIcon = "";
  String cityName = "";
  String weatherMessage = "";
  String condition = "";
  int humidity = 0;
  int atm = 0;
  double speed = 0;
  double today_min = 0;
  double today_max = 0;
  double todayTemp = 0;
  String todayDay = "";

  double tomorrow_min = 0;
  double tomorrow_max = 0;
  double tomorrowTemp = 0;
  String tomorrowDay = "";

  double thirdDay_min = 0;
  double thirdDay_max = 0;
  double thirdDayTemp = 0;
  String thirdDayDay = "";
  int aqi = 0;
  String time1 = "";
  String time2 = "";
  String time3 = "";
  String time4 = "";
  String time5 = "";
  String time6 = "";
  String time7 = "";
  String time8 = "";
  double temp1 = 0;
  double temp2 = 0;
  double temp3 = 0;
  double temp4 = 0;
  double temp5 = 0;
  double temp6 = 0;
  double temp7 = 0;
  double temp8 = 0;
  double speed1 = 0;
  double speed2 = 0;
  double speed3 = 0;
  double speed4 = 0;
  double speed5 = 0;
  double speed6 = 0;
  double speed7 = 0;
  double speed8 = 0;
  String condition1 = "";
  String condition2 = "";
  String condition3 = "";
  String condition4 = "";
  String condition5 = "";
  String condition6 = "";
  String condition7 = "";
  String condition8 = "";

  @override
  void initState() {
    super.initState();

    updateUI();
  }

  String weekDay(int? dayNumb) {
    if (dayNumb == 1) {
      return "Monday";
    } else if (dayNumb == 2) {
      return "Tuesday";
    } else if (dayNumb == 3) {
      return "Wednesday";
    } else if (dayNumb == 4) {
      return "Thursday";
    } else if (dayNumb == 5) {
      return "Friday";
    } else if (dayNumb == 6) {
      return "Saturday";
    } else if (dayNumb == 7) {
      return "Sunday";
    } else {
      return "null";
    }
  }

  getAQI(double lat, double lon) async {
    WeatherModel weatherModel =
        WeatherModel('https\://api.openweathermap.org/data/2.5/air_pollution');
    weatherDataAqi = await weatherModel.getAQILocationWeather(lat, lon);
    if (weatherDataAqi != null) {
      setState(() {
        aqi = int.parse((weatherDataAqi['list'][0]['main']['aqi']).toString());
      });
    }
  }

  void updateUI() async {
    WeatherModel weatherModel =
        WeatherModel('https\://api.openweathermap.org/data/2.5/forecast');
    weatherData = await weatherModel.getLocationWeather();
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        feel = 0;
        condition = "null";
        cityName = "null";
        humidity = 0;
        atm = 0;
        speed = 0;
        return;
      }
      /*Current Weather */
      double temp =
          double.parse((weatherData['list'][0]['main']['temp']).toString());
      temperature = temp.toInt();
      feel = (weatherData['list'][0]['main']['feels_like']);
      condition = weatherData['list'][0]['weather'][0]['main'];
      cityName = weatherData['city']['name'];
      humidity = weatherData['list'][0]['main']['humidity'];
      atm = weatherData['list'][0]['main']['pressure'];
      speed = (weatherData['list'][0]['wind']['speed']);
      isCity = false;
      /*Current Weather */

      /*Today Weather */
      today_min =
          double.parse((weatherData['list'][0]['main']['temp_min']).toString());
      today_max =
          double.parse((weatherData['list'][7]['main']['temp_max']).toString());
      todayTemp =
          double.parse((weatherData['list'][3]['main']['temp']).toString());
      todayDay = "Today";
      /*Today Weather */
      /*Second Day Weather */
      tomorrow_min =
          double.parse((weatherData['list'][8]['main']['temp_min']).toString());
      tomorrow_max = double.parse(
          (weatherData['list'][15]['main']['temp_max']).toString());
      tomorrowTemp =
          double.parse((weatherData['list'][11]['main']['temp']).toString());
      tomorrowDay = "Tomorrow";
      /*Second Day Weather */
      /*Third Day Weather */
      thirdDay_min = double.parse(
          (weatherData['list'][16]['main']['temp_min']).toString());
      thirdDay_max = double.parse(
          (weatherData['list'][23]['main']['temp_max']).toString());
      thirdDayTemp =
          double.parse((weatherData['list'][19]['main']['temp']).toString());
      thirdDayDay = weekDay(
          (DateTime.tryParse(weatherData['list'][19]['dt_txt'])?.weekday));
      /*Third Day Weather */
      lat = weatherData['city']['coord']['lat'];
      lon = weatherData['city']['coord']['lon'];
      getAQI(lat, lon);
      getHourlyData();
    });
  }

  String selectImage() {
    if (condition == "Clouds") {
      return "assets/images/cloudy.png";
    } else if (condition == "Rain") {
      return "assets/images/rainy.png";
    } else if (condition == "Clear") {
      return "assets/images/sunny.png";
    } else if (condition == "Clear") {
      return "assets/images/moderate.png";
    } else {
      return "";
    }
  }

  getHourlyData() async {
    setState(() {
      /*Temperatures*/
      temp1 = double.parse((weatherData['list'][0]['main']['temp']).toString());
      temp2 = double.parse((weatherData['list'][1]['main']['temp']).toString());
      temp3 = double.parse((weatherData['list'][2]['main']['temp']).toString());
      temp4 = double.parse((weatherData['list'][3]['main']['temp']).toString());
      temp5 = double.parse((weatherData['list'][4]['main']['temp']).toString());
      temp6 = double.parse((weatherData['list'][5]['main']['temp']).toString());
      temp7 = double.parse((weatherData['list'][6]['main']['temp']).toString());
      temp8 = double.parse((weatherData['list'][7]['main']['temp']).toString());

      /*Speed of air*/
      speed1 = double.parse((weatherData['list'][0]['wind']['speed']).toString());
      speed2 = double.parse((weatherData['list'][1]['wind']['speed']).toString());
      speed3 =double.parse((weatherData['list'][2]['wind']['speed']).toString());
      speed4 = double.parse((weatherData['list'][3]['wind']['speed']).toString());
      speed5 = double.parse((weatherData['list'][4]['wind']['speed']).toString());
      speed6 = double.parse((weatherData['list'][5]['wind']['speed']).toString());
      speed7 = double.parse((weatherData['list'][6]['wind']['speed']).toString());
      speed8 = double.parse((weatherData['list'][7]['wind']['speed']).toString());

/*Time*/
      DateTime? dateTime1 = DateTime.tryParse(weatherData['list'][0]['dt_txt']);
      time1 = DateFormat.jm().format(dateTime1!);
      DateTime? dateTime2 = DateTime.tryParse(weatherData['list'][1]['dt_txt']);
      time2 = DateFormat.jm().format(dateTime2!);
      DateTime? dateTime3 = DateTime.tryParse(weatherData['list'][2]['dt_txt']);
      time3 = DateFormat.jm().format(dateTime3!);
      DateTime? dateTime4 = DateTime.tryParse(weatherData['list'][3]['dt_txt']);
      time4 = DateFormat.jm().format(dateTime4!);
      DateTime? dateTime5 = DateTime.tryParse(weatherData['list'][4]['dt_txt']);
      time5 = DateFormat.jm().format(dateTime5!);
      DateTime? dateTime6 = DateTime.tryParse(weatherData['list'][5]['dt_txt']);
      time6 = DateFormat.jm().format(dateTime6!);
      DateTime? dateTime7 = DateTime.tryParse(weatherData['list'][6]['dt_txt']);
      time7 = DateFormat.jm().format(dateTime7!);
      DateTime? dateTime8 = DateTime.tryParse(weatherData['list'][7]['dt_txt']);
      time8 = DateFormat.jm().format(dateTime8!);

      /*Condition*/
      condition1 = weatherData['list'][0]['weather'][0]['main'];
      condition2 = weatherData['list'][1]['weather'][0]['main'];
      condition3 = weatherData['list'][2]['weather'][0]['main'];
      condition4 = weatherData['list'][3]['weather'][0]['main'];
      condition5 = weatherData['list'][4]['weather'][0]['main'];
      condition6 = weatherData['list'][5]['weather'][0]['main'];
      condition7 = weatherData['list'][6]['weather'][0]['main'];
      condition8 = weatherData['list'][7]['weather'][0]['main'];
    });
  }

  getCityWeather() async {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      WeatherModel weatherModel =
          WeatherModel('https\://api.openweathermap.org/data/2.5/forecast');
      weatherData =
          await weatherModel.getCityWeather(weatherFieldController.text);
      setState(() {
        if (weatherData == null) {
          temperature = 0;
          feel = 0;
          condition = "null";
          cityName = "null";
          humidity = 0;
          atm = 0;
          speed = 0;
          return;
        }
        /*Current Weather */
        double temp = weatherData['list'][0]['main']['temp'];
        temperature = temp.toInt();
        feel = (weatherData['list'][0]['main']['feels_like']);
        condition = weatherData['list'][0]['weather'][0]['main'];
        cityName = weatherData['city']['name'];
        humidity = weatherData['list'][0]['main']['humidity'];
        atm = weatherData['list'][0]['main']['pressure'];
        speed = (weatherData['list'][0]['wind']['speed']);
        isCity = true;
        /*Current Weather */

        /*Today Weather */
        today_min = double.parse(
            (weatherData['list'][0]['main']['temp_min']).toString());
        today_max = double.parse(
            (weatherData['list'][7]['main']['temp_max']).toString());
        todayTemp =
            double.parse((weatherData['list'][3]['main']['temp']).toString());
        todayDay = "Today";
        /*Today Weather */
        /*Second Day Weather */
        tomorrow_min = double.parse(
            (weatherData['list'][8]['main']['temp_min']).toString());
        tomorrow_max = double.parse(
            (weatherData['list'][15]['main']['temp_max']).toString());
        tomorrowTemp =
            double.parse((weatherData['list'][11]['main']['temp']).toString());
        tomorrowDay = "Tomorrow";
        /*Second Day Weather */
        /*Third Day Weather */
        thirdDay_min = double.parse(
            (weatherData['list'][16]['main']['temp_min']).toString());
        thirdDay_max = double.parse(
            (weatherData['list'][23]['main']['temp_max']).toString());
        thirdDayTemp =
            double.parse((weatherData['list'][19]['main']['temp']).toString());
        thirdDayDay = weekDay(
            (DateTime.tryParse(weatherData['list'][19]['dt_txt'])?.weekday));
        /*Third Day Weather */
        lat = weatherData['city']['coord']['lat'];
        lon = weatherData['city']['coord']['lon'];
        getAQI(lat, lon);
        getHourlyData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return weatherData == null
        ? Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(selectImage()),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.8), BlendMode.dstATop),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          cityName,
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: height * 0.03,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                weatherFieldController.clear();
                                updateUI();
                              },
                              icon: Icon(
                                Icons.location_pin,
                                color: Colors.white,
                              )),
                          Container(
                            width: width - 80,
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "City name Required";
                                  }
                                  if (value == "" || value == " ") {
                                    return "Field can not be empty Required";
                                  }
                                  return null;
                                },
                                controller: weatherFieldController,
                                decoration:
                                    kMessageTextFieldDecoration.copyWith(
                                        hintText: 'Enter complete name of city',
                                        fillColor: Color(0xffE7E6E6),
                                        filled: true,
                                        prefixIcon: IconButton(
                                          onPressed: () async {
                                            getCityWeather();
                                          },
                                          icon: Icon(
                                            Icons.search,
                                            color: Colors.grey,
                                          ),
                                        )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              temperature.toString(),
                              style: TextStyle(
                                // fontFamily: "Cairo Light",
                                color: Color(0xffFDFDFD),
                                fontSize: height * 0.15,
                              ),
                            ),
                            Text(
                              "\u00B0" + "C",
                              style: TextStyle(
                                fontSize: height * 0.05,
                                fontFeatures: [
                                  FontFeature.superscripts(),
                                ],
                                color: Color(0xffFDFDFD),
                                // fontSize: height * 0.15,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          condition,
                          style: TextStyle(
                              color: Color(0xffFDFDFD),
                              fontSize: height * 0.021),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AQI(height, aqi),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  HourlyForecast(
                                      height, time1, temp1, speed1, condition1),
                                  HourlyForecast(
                                      height, time2, temp2, speed2, condition2),
                                  HourlyForecast(
                                      height, time3, temp3, speed3, condition3),
                                  HourlyForecast(
                                      height, time4, temp4, speed4, condition4),
                                  HourlyForecast(
                                      height, time5, temp5, speed5, condition5),
                                  HourlyForecast(
                                      height, time6, temp6, speed6, condition6),
                                  HourlyForecast(
                                      height, time7, temp7, speed7, condition7),
                                  HourlyForecast(
                                      height, time8, temp8, speed8, condition8),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFFFF).withOpacity(0.4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          margin: EdgeInsets.only(
                              left: 16, right: 16, top: 10, bottom: 10),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DayForecast(height, todayDay, today_max,
                                  today_min, today_min),
                              SizedBox(height: 40),
                              DayForecast(height, tomorrowDay, tomorrow_max,
                                  tomorrow_min, tomorrowTemp),
                              SizedBox(height: 40),
                              DayForecast(height, thirdDayDay, thirdDay_max,
                                  thirdDay_min, thirdDayTemp),
                            ],
                          ),
                        ),
                        Container(
                          width: width,
                          margin: EdgeInsets.only(
                              top: 16, bottom: 16, right: 16, left: 16),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => FiveDayForecast(
                                        isCity,
                                        weatherFieldController.text,
                                        height),
                                  ),
                                );
                              },
                              child: Text(
                                "5-Day Forecast",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.0175),
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFFFF).withOpacity(0.4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          margin: EdgeInsets.only(
                              left: 16, right: 16, top: 10, bottom: 20),
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AtmosphereQuality(
                                  height,
                                  "${feel.toStringAsFixed(0)}\u00B0 C",
                                  "55%",
                                  "$speed km/h",
                                  "Real Feel",
                                  "Chance of rain",
                                  "Wind Speed",
                                  CrossAxisAlignment.start),
                              AtmosphereQuality(
                                  height,
                                  "$atm atm",
                                  "$humidity%",
                                  "7",
                                  "Pressure",
                                  "Humidity",
                                  "UV Index",
                                  CrossAxisAlignment.end),
                            ],
                          ),
                        ),
                        AirQuality(height, aqi),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
