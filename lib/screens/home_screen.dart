import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/cards/air_quality.dart';
import 'package:weather/cards/atmosphere_quality.dart';
import 'package:weather/cards/hourly_forecast_creation.dart';
import 'package:weather/models/constants.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/screens/five_day_forecast.dart';
import 'package:weather/widgets/aqi.dart';

import '../widgets/day_forecast.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 0;
  double width = 0;
  int isCity=0;
  var weatherData;
  final weatherFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

  @override
  void initState() {
    super.initState();

    updateUI();
  }

  String weekDay(int? dayNumb){
    if(dayNumb==1){
      return "Monday";
    }else if(dayNumb==2){
      return "Tuesday";
    }else if(dayNumb==3){
      return "Wednesday";
    }else if(dayNumb==4){
      return "Thursday";
    }else if(dayNumb==5){
      return "Friday";
    }else if(dayNumb==6){
      return "Saturday";
    }else if(dayNumb==7){
      return "Sunday";
    }else{
      return "null";
    }
  }

  void updateUI() async {
    WeatherModel weatherModel = WeatherModel('https\://api.openweathermap.org/data/2.5/forecast');
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
      double temp = weatherData['list'][0]['main']['temp'];
      temperature = temp.toInt();
      feel = (weatherData['list'][0]['main']['feels_like']);
      condition = weatherData['list'][0]['weather'][0]['main'];
      cityName = weatherData['city']['name'];
      humidity = weatherData['list'][0]['main']['humidity'];
      atm = weatherData['list'][0]['main']['pressure'];
      speed = (weatherData['list'][0]['wind']['speed']);
      isCity=0;
      /*Current Weather */

      /*Today Weather */
      today_min = weatherData['list'][0]['main']['temp_min'];
      today_max = weatherData['list'][7]['main']['temp_max'];
      todayTemp = weatherData['list'][3]['main']['temp'];
      todayDay = "Today";
      /*Today Weather */
      /*Second Day Weather */
      tomorrow_min = weatherData['list'][8]['main']['temp_min'];
      tomorrow_max = weatherData['list'][15]['main']['temp_max'];
      tomorrowTemp = weatherData['list'][11]['main']['temp'];
      tomorrowDay = "Tomorrow";
      /*Second Day Weather */
      /*Third Day Weather */
      thirdDay_min = weatherData['list'][16]['main']['temp_min'];
      thirdDay_max = weatherData['list'][23]['main']['temp_max'];
      thirdDayTemp = weatherData['list'][19]['main']['temp'];
      thirdDayDay = weekDay((DateTime.tryParse(weatherData['list'][19]['dt_txt'])?.weekday));
      /*Third Day Weather */
    });
  }

  String selectImage() {
    if (condition=="Clouds") {
      return "assets/images/cloudy.png";
    } else if (condition=="Rain") {
      return "assets/images/rainy.png";
    } else if (condition=="Clear") {
      return "assets/images/moderate.png";
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return weatherData==null?Center(child: CircularProgressIndicator()):Stack(
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: weatherFieldController,
                  decoration: kMessageTextFieldDecoration.copyWith(
                      hintText: 'Enter complete name of city',
                      fillColor: Color(0xffE7E6E6),
                      filled: true,
                      // prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () async{
                          FocusManager.instance.primaryFocus?.unfocus();
                          WeatherModel weatherModel = WeatherModel('https\://api.openweathermap.org/data/2.5/forecast');
                          weatherData = await weatherModel.getCityWeather(weatherFieldController.text);
                          sleep(Duration(seconds: 3));
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
                            isCity=1;
                            /*Current Weather */

                            /*Today Weather */
                            today_min = weatherData['list'][0]['main']['temp_min'];
                            today_max = weatherData['list'][7]['main']['temp_max'];
                            todayTemp = weatherData['list'][3]['main']['temp'];
                            todayDay = "Today";
                            /*Today Weather */
                            /*Second Day Weather */
                            tomorrow_min = weatherData['list'][8]['main']['temp_min'];
                            tomorrow_max = weatherData['list'][15]['main']['temp_max'];
                            tomorrowTemp = weatherData['list'][11]['main']['temp'];
                            tomorrowDay = "Tomorrow";
                            /*Second Day Weather */
                            /*Third Day Weather */
                            thirdDay_min = weatherData['list'][16]['main']['temp_min'];
                            thirdDay_max = weatherData['list'][23]['main']['temp_max'];
                            thirdDayTemp = weatherData['list'][19]['main']['temp'];
                            thirdDayDay = weekDay((DateTime.tryParse(weatherData['list'][19]['dt_txt'])?.weekday));
                            /*Third Day Weather */
                          });
                        },
                        icon: Icon(Icons.search),
                      )),
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
                        color: Color(0xffFDFDFD), fontSize: height * 0.021),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AQI(height,weatherFieldController.text,isCity),
                  HourlyForecastCreation(height,weatherFieldController.text,isCity),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFFFF).withOpacity(0.4),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
                    padding: EdgeInsets.all(10),
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
                        top: 10, bottom: 10, right: 30, left: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => FiveDayForecast(isCity,weatherFieldController.text),
                            ),
                          );
                        },
                        child: Text(
                          "5-Day Forecast",
                          style: TextStyle(
                              color: Colors.white, fontSize: height * 0.0175),
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFFFF).withOpacity(0.4),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 20),
                    padding: EdgeInsets.all(30),
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
                            "",
                            "Pressure",
                            "Humidity",
                            "",
                            CrossAxisAlignment.end),
                      ],
                    ),
                  ),
                  AirQuality(height,weatherFieldController.text,isCity),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
