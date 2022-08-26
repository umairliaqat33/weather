import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/cards/air_quality.dart';
import 'package:weather/cards/atmosphere_quality.dart';
import 'package:weather/cards/three_day_forecast_card.dart';
import 'package:weather/models/constants.dart';
import 'package:weather/screens/seven_day_forecast.dart';
import 'package:weather/widgets/aqi.dart';
import 'package:weather/widgets/hourly_forecast.dart';

class HomeScreen extends StatelessWidget {
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          "assets/images/moderate.png",
          fit: BoxFit.fill,
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
                    "City",
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
                  decoration: kMessageTextFieldDecoration.copyWith(
                    hintText: 'Enter complete name of city',
                    fillColor: Color(0xffE7E6E6),
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "26",
                            style: TextStyle(
                              // fontFamily: "Cairo Light",
                              color: Color(0xffFDFDFD),
                              fontSize: height * 0.15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: Text(
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
                        ),
                      ],
                    ),
                    Text(
                      "Weather Condition",
                      style: TextStyle(
                          color: Color(0xffFDFDFD), fontSize: height * 0.021),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AQI(height),
                    Container(
                      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HourlyForecast(height, "Time 1", 30),
                            HourlyForecast(height, "Time 2", 49),
                            HourlyForecast(height, "Time 3", 15),
                            HourlyForecast(height, "Time 4", 20),
                            HourlyForecast(height, "Time 5", 33),
                            HourlyForecast(height, "Time 6", 50),
                            HourlyForecast(height, "Time 7", 8),
                            HourlyForecast(height, "Time 8", 35),
                          ],
                        ),
                      ),
                    ),
                    ThreeDayForecast(height),
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
                                builder: (context) => SevenDayForecast(),
                              ),
                            );
                          },
                          child: Text(
                            "7-Day Forecast",
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
                              "32\u00B0 C",
                              "55%",
                              "26.7 km/h",
                              "Real Feel",
                              "Chance of rain",
                              "Wind Speed",
                              CrossAxisAlignment.start),
                          AtmosphereQuality(
                              height,
                              "62%",
                              "0 atm",
                              "7",
                              "Humidity",
                              "Pressure",
                              "UV Index",
                              CrossAxisAlignment.end),
                        ],
                      ),
                    ),
                    AirQuality(height),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
