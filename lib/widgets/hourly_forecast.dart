import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HourlyForecast extends StatelessWidget {
  double height;
  String time ;
  double temp ;
  double speed ;
  String condition;

  HourlyForecast(this.height, this.time, this.temp,this.speed,this.condition);


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
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(16),
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
            height: height*0.035,
            child: Image.asset(selectCloud()),
          ),
          Row(
            children: [
              Container(
                height: height*0.012,
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
  }
}
