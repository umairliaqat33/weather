import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/models/constants.dart';
import 'package:weather/widgets/aqi.dart';
import 'package:weather/widgets/hourly_forecast.dart';

class HomeScreen extends StatelessWidget {
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/clear.png"), fit: BoxFit.fill),
      ),
      child: SingleChildScrollView(
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
                left: 20,
                right: 20,
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
              padding: const EdgeInsets.only(top: 60),
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
                            color: Color(0xffFDFDFD),
                            fontSize: height * 0.15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 80),
                        child: Text(
                          "\u2103",
                          style: TextStyle(
                            fontSize: height*0.05,
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
                    padding: EdgeInsets.only(top: 40,left: 20,right: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HourlyForecast(height,"Time 1",30),
                          HourlyForecast(height,"Time 2",49),
                          HourlyForecast(height,"Time 3",15),
                          HourlyForecast(height,"Time 4",20),
                          HourlyForecast(height,"Time 5",33),
                          HourlyForecast(height,"Time 6",50),
                          HourlyForecast(height,"Time 7",8),
                          HourlyForecast(height,"Time 8",35),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
