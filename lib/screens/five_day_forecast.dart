import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/weather_model.dart';

class FiveDayForecast extends StatefulWidget {
  double height;
  FiveDayForecast(this.height,);

  @override
  State<FiveDayForecast> createState() => _FiveDayForecastState();
}

class _FiveDayForecastState extends State<FiveDayForecast> {
  String time = " ";

  double temp = 0;

  double speed = 0;

  void getData(int index) async {
    WeatherModel weatherModel =
    WeatherModel('https://api.openweathermap.org/data/2.5/forecast');
    var weatherData = await weatherModel.getLocationWeather();
    if(weatherData!=null){
        DateTime? dateTime =
             await DateTime.tryParse(weatherData['list'][index]['dt_txt']);
        time = DateFormat.Hm().format(dateTime!);
        temp =  await weatherData['list'][index]['temp'];
        speed = await weatherData['list'][index]['wind']['speed'];
    }
  }

  String selectCloud() {
    if(temp>=25&&temp<38){
      return "assets/images/icons/cloudy_icon.png";
    }else if(temp>38){
      return "assets/images/icons/sunny_icon.png";
    }else if(temp<25){
      return "assets/images/icons/rainy_icon.png";
    }else{
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6988FF),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff3B00FE),
            Color(0xff3B01FE),
            Color(0xff3D05FE),
            Color(0xff3F0BFE),
            Color(0xff4214FE),
            Color(0xff451EFE),
            Color(0xff492AFE),
            Color(0xff4E37FE),
            Color(0xff5244FE),
            Color(0xff5651FF),
            Color(0xff5B5EFF),
            Color(0xff5F6AFF),
            Color(0xff6274FF),
            Color(0xff657DFF),
            Color(0xff6783FF),
            Color(0xff6987FF),
            Color(0xff6988FF),
          ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
        ),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            getData(index);
            return Container(
              height: height*0.02,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: height * 0.0175,
                      color: Color(0xffEFF0F1),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        temp.toStringAsFixed(0),
                        style: TextStyle(
                          fontSize: height * 0.03,
                          color: Color(0xffFDFDFD),
                        ),
                      ),
                      Text(
                        "\u00B0",
                        style: TextStyle(color: Color(0xffFFFFFF), fontFeatures: [
                          FontFeature.superscripts(),
                        ]),
                      )
                    ],
                  ),
                  Container(
                    height: height * 0.035,
                    child: Image.asset(selectCloud()),
                  ),
                  Row(
                    children: [
                      Container(
                        height: height * 0.012,
                        child: Image.asset("assets/images/icons/navigate_icon.png"),
                      ),
                      Text(
                        speed.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: height * 0.0175,
                          color: Color(0xffEFF0F1),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
