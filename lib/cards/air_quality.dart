import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class AirQuality extends StatefulWidget {
  double height;

  AirQuality(this.height);

  @override
  State<AirQuality> createState() => _AirQualityState();
}

class _AirQualityState extends State<AirQuality> {
  int aqi=0;

  @override
  void initState() {
    super.initState();
    getAQI();
  }


  getAQI()async{
    WeatherModel weatherModel = WeatherModel('https\://api.openweathermap.org/data/2.5/air_pollution');
    var weatherData = await weatherModel.getLocationWeather();
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
          color: Color(0xffFFFF).withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 20),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Air Quality Index",
            style: TextStyle(
              color: Colors.white,
              fontSize: widget.height * 0.0175,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: widget.height * 0.0175,
                      color: Colors.white,
                    ),
                    children: [
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 5),
                          height: widget.height * 0.03,
                          child: Image.asset("assets/images/icons/leaf_icon.png"),
                        ),
                      ),
                      TextSpan(
                        text: aqi.toString(),
                        style: TextStyle(
                          fontSize: widget.height * 0.03,
                          color: Colors.white,
                        ),
                      )
                    ]),
              ),
              Text(
                "Full air quality forecast",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: widget.height * 0.0175,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
