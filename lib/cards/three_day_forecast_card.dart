import 'package:flutter/material.dart';
import 'package:weather/widgets/day_forecast.dart';

class ThreeDayForecast extends StatelessWidget {
  double height;
  ThreeDayForecast(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffFFFF).withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DayForecast(35,height),
          SizedBox(height: 40),
          DayForecast(40,height),
          SizedBox(height: 40),
          DayForecast(21,height),
        ],
      ),
    );
  }
}
