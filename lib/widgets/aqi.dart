import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class AQI extends StatefulWidget {
  String city;
  int isCity;
  double height;
  AQI(this.height,this.city,this.isCity);

  @override
  State<AQI> createState() => _AQIState();
}

class _AQIState extends State<AQI> {
  int aqi=0;

  @override
  void initState() {
    super.initState();
    getAQI();
  }

  getAQI()async{
    WeatherModel weatherModel = WeatherModel('https\://api.openweathermap.org/data/2.5/air_pollution');
    var weatherData = (widget.isCity==1?await weatherModel.getCityWeather(widget.city): await weatherModel.getLocationWeather());
    if(weatherData!=null){
      setState(() {
        aqi=int.parse((weatherData['list'][0]['main']['aqi']).toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffFFFFFF),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.only(right: 4, left: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(right: 4),
              height: widget.height * 0.012,
              child: Image.asset("assets/images/icons/leaf_icon.png"),
            ),
            Text(
              "AQI  ",
              style:
                  TextStyle(fontSize: widget.height * 0.016, color: Color(0xffFDFDFD)),
            ),
            Text(
              aqi.toString(),
              style:
                  TextStyle(fontSize: widget.height * 0.016, color: Color(0xffFDFDFD)),
            ),
          ],
        ),
      ),
    );
  }
}
