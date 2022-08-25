import 'dart:ui';

import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  double height;
  int temp;
  String time;

  HourlyForecast(this.height, this.time, this.temp);

  String selectCloud(){
    if(temp>=30&&temp<38){
      return "images/icons/cloudy.png";
    }else if(temp>38){
      return "images/icons/sunny.png";
    }else if(temp<29){
      return "images/icons/rainy.png";
    }else{
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "Time",
            style: TextStyle(
              fontSize: height * 0.0175,
              color: Color(0xffEFF0F1),
            ),
          ),
          Row(
            children: [
              Text(
                temp.toString(),
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
                child: Image.asset("images/icons/navigate.png"),
              ),
              Text("Air",style: TextStyle(
                fontSize: height * 0.0175,
                color: Color(0xffEFF0F1),
              ),),
            ],
          )
        ],
      ),
    );
  }
}