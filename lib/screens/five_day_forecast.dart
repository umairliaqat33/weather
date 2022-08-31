import 'package:flutter/material.dart';

import 'package:weather/widgets/daily_forecast.dart';

// ignore: must_be_immutable
class FiveDayForecast extends StatelessWidget {
  double height;
  bool isCity;
  String city;

  FiveDayForecast(this.isCity, this.city, this.height);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "5-Day Forecast",
          style: TextStyle(color: Colors.white),
        ),
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/five_day_forecast.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.199,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return DailyForecast(height, index * 8, city, isCity);
              },
            ),
          )
        ],
      ),
    );
  }
}
