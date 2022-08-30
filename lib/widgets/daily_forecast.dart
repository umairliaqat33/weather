import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class DailyForecast extends StatefulWidget {
  DailyForecast(this.height, this.index,this.city,this.isCity);
  int isCity;
  String city;
  int index;
  double height;

  @override
  State<DailyForecast> createState() => _DailyForecastState();
}

class _DailyForecastState extends State<DailyForecast> {
  String time = " ";
  String condition="";
  var weatherData;
  double temp = 0;

  double speed = 0;
  String weekDay(int? dayNumb){
    if(dayNumb==0){
      return "Monday";
    }else if(dayNumb==1){
      return "Tuesday";
    }else if(dayNumb==2){
      return "Wednesday";
    }else if(dayNumb==3){
      return "Thursday";
    }else if(dayNumb==4){
      return "Friday";
    }else if(dayNumb==5){
      return "Saturday";
    }else if(dayNumb==6){
      return "Sunday";
    }else{
      return "null";
    }
  }
  void updateUI() async {
    WeatherModel weatherModel = WeatherModel('https\://api.openweathermap.org/data/2.5/forecast');
    weatherData = (widget.isCity==1?await weatherModel.getCityWeather(widget.city): await weatherModel.getLocationWeather());
    setState(() {
      print(widget.index);
      print(widget.isCity);
      print(widget.city);
      temp=weatherData['list'][widget.index]['main']['temp'];
      time = weekDay((DateTime.tryParse(weatherData['list'][widget.index]['dt_txt'])?.weekday));
      speed=weatherData['list'][widget.index]['wind']['speed'];
      condition=weatherData['list'][widget.index]['weather'][0]['main'];
      print((DateTime.tryParse(weatherData['list'][widget.index]['dt_txt'])?.weekday));
      print(condition);
      print(weatherData['list'][widget.index]['dt_txt']);
    });
  }



  String selectCloud() {
    if (condition=="Clouds") {
      return "assets/images/icons/cloudy_icon.png";
    } else if (condition=="Rain") {
      return "assets/images/icons/rainy_icon.png";
    } else if (condition=="Clear") {
      return "assets/images/icons/sunny_icon.png";
    } else {
      return "";
    }
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }
  @override
  Widget build(BuildContext context) {
    return weatherData==null?CircularProgressIndicator(): Container(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: widget.height * 0.0175,
              color: Color(0xffEFF0F1),
            ),
          ),
          Row(
            children: [
              Text(
                temp.toStringAsFixed(0),
                style: TextStyle(
                  fontSize: widget.height * 0.03,
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
            height: widget.height * 0.035,
            child: Image.asset(selectCloud()),
          ),
          Row(
            children: [
              Container(
                height: widget.height * 0.012,
                child: Image.asset("assets/images/icons/navigate_icon.png"),
              ),
              Text(
                speed.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: widget.height * 0.0175,
                  color: Color(0xffEFF0F1),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}