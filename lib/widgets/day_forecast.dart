import 'package:flutter/material.dart';

class DayForecast extends StatelessWidget {
  double height;
  int temp;

  DayForecast(this.temp,this.height);

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
                  text: "Today - Weather Condition",
                  style: TextStyle(
                    fontSize: height * 0.0175,
                    color: Colors.white,
                  ),
                )
              ]),
        ),
        Text(
          "26\u00B0/30\u00B0",
          style: TextStyle(
            color: Colors.white,
            fontSize: height * 0.0175,
          ),
        )
      ],
    );
  }
}
