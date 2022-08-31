import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DayForecast extends StatelessWidget {
  double height;
  String day;
  double temp_min;
  double temp_max;
  double temp;
  DayForecast(this.height,this.day,this.temp_max,this.temp_min,this.temp);


  String selectPicture() {
    if (temp >= 25 && temp < 38) {
      return "assets/images/icons/cloudy_icon.png";
    } else if (temp > 38) {
      return "assets/images/icons/sunny_icon.png";
    } else if (temp < 25) {
      return "assets/images/icons/rainy_icon.png";
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: height * 0.0175,
                color: Colors.white,
              ),
              children: [
                WidgetSpan(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 5),
                    height: height * 0.03,
                    child: Image.asset(selectPicture()),
                  ),
                ),
                TextSpan(
                  text: "$day",
                  style: TextStyle(
                    fontSize: height * 0.0175,
                    color: Colors.white,
                  ),
                )
              ]),
        ),
        Text(
          "$temp_min\u00B0/$temp_max\u00B0",
          style: TextStyle(
            color: Colors.white,
            fontSize: height * 0.0175,
          ),
        )
      ],
    );
  }
}
