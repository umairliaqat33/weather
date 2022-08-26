import 'package:flutter/material.dart';
import 'package:weather/screens/home_screen.dart';
import 'package:weather/widgets/hourly_forecast.dart';

class SevenDayForecast extends StatelessWidget {
  const SevenDayForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff3B00FE),
            Color(0xff3B01FE),
            Color(0xff3D05FE),
            Color(0xff3F0BFE),
            Color(0xff4214FE),
            Color(0xff451EFE),
            Color(0xff492AFE),
            Color(0xff4E37FE),
            Color(0xff5244FE),
            Color(0xff5651FF),
            Color(0xff5B5EFF),
            Color(0xff5F6AFF),
            Color(0xff6274FF),
            Color(0xff657DFF),
            Color(0xff6783FF),
            Color(0xff6987FF),
            Color(0xff6988FF),
          ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
        ),
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
    );
  }
}
