
import 'package:flutter/material.dart';
import 'package:weather/widgets/daily_forecast.dart';

class FiveDayForecast extends StatelessWidget {
  int isCity;
  String city;
  FiveDayForecast(this.isCity,this.city);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("5-Day Forecast",style: TextStyle(
          color: Colors.white
        ),),
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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return DailyForecast(height, index*8,city,isCity);
          },
        ),
      ),
    );
  }
}
