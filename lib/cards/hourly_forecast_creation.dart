import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/weather_model.dart';

// ignore: must_be_immutable
class HourlyForecastCreation extends StatefulWidget {
  double height;

  HourlyForecastCreation(this.height);

  @override
  State<HourlyForecastCreation> createState() => _HourlyForecastCreationState();
}

class _HourlyForecastCreationState extends State<HourlyForecastCreation> {
  String time = " ";
  double temp = 0;
  double speed = 0;
  void getData(int index) async {
    WeatherModel weatherModel =
    WeatherModel('https\://api.openweathermap.org/data/2.5/forecast');
    var weatherData = await weatherModel.getLocationWeather();
    DateTime? dateTime =
    await DateTime.tryParse(weatherData['list'][index]['dt_txt']);
    time = DateFormat.Hm().format(dateTime!);
    temp = weatherData['list'][index]['temp'];
    speed = weatherData['list'][index]['wind']['speed'];
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
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        getData(index);
        return Container(
          height: widget.height*0.02,
          padding: EdgeInsets.all(10),
          child: Column(
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
      },
    );
  }
}
