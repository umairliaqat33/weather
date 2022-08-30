import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/widgets/hourly_forecast.dart';

import '../models/weather_model.dart';

// ignore: must_be_immutable
class HourlyForecastCreation extends StatefulWidget {
  String city;
  int isCity;
  double height;

  HourlyForecastCreation(this.height,this.city,this.isCity);

  @override
  State<HourlyForecastCreation> createState() => _HourlyForecastCreationState();
}

class _HourlyForecastCreationState extends State<HourlyForecastCreation> {
  var weatherData;
  String time1 = "";
  String time2 = "";
  String time3 = "";
  String time4 = "";
  String time5 = "";
  String time6 = "";
  String time7 = "";
  String time8 = "";
  double temp1 = 0;
  double temp2 = 0;
  double temp3 = 0;
  double temp4 = 0;
  double temp5 = 0;
  double temp6 = 0;
  double temp7 = 0;
  double temp8 = 0;
  double speed1 = 0;
  double speed2 = 0;
  double speed3 = 0;
  double speed4 = 0;
  double speed5 = 0;
  double speed6 = 0;
  double speed7 = 0;
  double speed8 = 0;
  String condition1="";
  String condition2="";
  String condition3="";
  String condition4="";
  String condition5="";
  String condition6="";
  String condition7="";
  String condition8="";

  getData() async {
    WeatherModel weatherModel =
        WeatherModel('https\://api.openweathermap.org/data/2.5/forecast');
    weatherData = (widget.isCity==1?await weatherModel.getCityWeather(widget.city): await weatherModel.getLocationWeather());
    setState(() {
      /*Temperatures*/
      temp1 = weatherData['list'][0]['main']['temp'];
      temp2 = weatherData['list'][1]['main']['temp'];
      temp3 = weatherData['list'][2]['main']['temp'];
      temp4 = weatherData['list'][3]['main']['temp'];
      temp5 = weatherData['list'][4]['main']['temp'];
      temp6 = weatherData['list'][5]['main']['temp'];
      temp7 = weatherData['list'][6]['main']['temp'];
      temp8 = weatherData['list'][7]['main']['temp'];

      /*Speed of air*/
      speed1 = weatherData['list'][0]['wind']['speed'];
      speed2 = weatherData['list'][1]['wind']['speed'];
      speed3 = weatherData['list'][2]['wind']['speed'];
      speed4 = weatherData['list'][3]['wind']['speed'];
      speed5 = weatherData['list'][4]['wind']['speed'];
      speed6 = weatherData['list'][5]['wind']['speed'];
      speed7 = weatherData['list'][6]['wind']['speed'];
      speed8 = weatherData['list'][7]['wind']['speed'];

/*Time*/
      DateTime? dateTime1 = DateTime.tryParse(weatherData['list'][0]['dt_txt']);
      time1 = DateFormat.jm().format(dateTime1!);
      DateTime? dateTime2 = DateTime.tryParse(weatherData['list'][1]['dt_txt']);
      time2 = DateFormat.jm().format(dateTime2!);
      DateTime? dateTime3 = DateTime.tryParse(weatherData['list'][2]['dt_txt']);
      time3 = DateFormat.jm().format(dateTime3!);
      DateTime? dateTime4 = DateTime.tryParse(weatherData['list'][3]['dt_txt']);
      time4 = DateFormat.jm().format(dateTime4!);
      DateTime? dateTime5 = DateTime.tryParse(weatherData['list'][4]['dt_txt']);
      time5 = DateFormat.jm().format(dateTime5!);
      DateTime? dateTime6 = DateTime.tryParse(weatherData['list'][5]['dt_txt']);
      time6 = DateFormat.jm().format(dateTime6!);
      DateTime? dateTime7 = DateTime.tryParse(weatherData['list'][6]['dt_txt']);
      time7 = DateFormat.jm().format(dateTime7!);
      DateTime? dateTime8 = DateTime.tryParse(weatherData['list'][7]['dt_txt']);
      time8 = DateFormat.jm().format(dateTime8!);

      /*Condition*/
      condition1=weatherData['list'][0]['weather'][0]['main'];
      condition2=weatherData['list'][1]['weather'][0]['main'];
      condition3=weatherData['list'][2]['weather'][0]['main'];
      condition4=weatherData['list'][3]['weather'][0]['main'];
      condition5=weatherData['list'][4]['weather'][0]['main'];
      condition6=weatherData['list'][5]['weather'][0]['main'];
      condition7=weatherData['list'][6]['weather'][0]['main'];
      condition8=weatherData['list'][7]['weather'][0]['main'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return weatherData==null?Center(
      child: CircularProgressIndicator(),
    ):  Container(
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: Row(
            children: [
              HourlyForecast(widget.height, time1, temp1, speed1,condition1),
              HourlyForecast(widget.height, time2, temp2, speed2,condition2),
              HourlyForecast(widget.height, time3, temp3, speed3,condition3),
              HourlyForecast(widget.height, time4, temp4, speed4,condition4),
              HourlyForecast(widget.height, time5, temp5, speed5,condition5),
              HourlyForecast(widget.height, time6, temp6, speed6,condition6),
              HourlyForecast(widget.height, time7, temp7, speed7,condition7),
              HourlyForecast(widget.height, time8, temp8, speed8,condition8),
            ],
          ),
        ),
      ),
    );
  }
}
