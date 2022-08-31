// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:weather/widgets/hourly_forecast.dart';
//
//
// // ignore: must_be_immutable
// class HourlyForecastCreation extends StatefulWidget {
//   String city;
//   bool isCity;
//   double height;
//   var  weatherData;
//   HourlyForecastCreation(this.height,this.city,this.isCity,this.weatherData);
//
//   @override
//   State<HourlyForecastCreation> createState() => _HourlyForecastCreationState();
// }
//
// class _HourlyForecastCreationState extends State<HourlyForecastCreation> {
//   String time1 = "";
//   String time2 = "";
//   String time3 = "";
//   String time4 = "";
//   String time5 = "";
//   String time6 = "";
//   String time7 = "";
//   String time8 = "";
//   double temp1 = 0;
//   double temp2 = 0;
//   double temp3 = 0;
//   double temp4 = 0;
//   double temp5 = 0;
//   double temp6 = 0;
//   double temp7 = 0;
//   double temp8 = 0;
//   double speed1 = 0;
//   double speed2 = 0;
//   double speed3 = 0;
//   double speed4 = 0;
//   double speed5 = 0;
//   double speed6 = 0;
//   double speed7 = 0;
//   double speed8 = 0;
//   String condition1="";
//   String condition2="";
//   String condition3="";
//   String condition4="";
//   String condition5="";
//   String condition6="";
//   String condition7="";
//   String condition8="";
//
//   getData() async {
//
//     setState(() {
//       /*Temperatures*/
//       temp1 = double.parse(( widget.weatherData['list'][0]['main']['temp']).toString());
//       temp2 = double.parse(( widget.weatherData['list'][1]['main']['temp']).toString());
//       temp3 = double.parse(( widget.weatherData['list'][2]['main']['temp']).toString());
//       temp4 = double.parse(( widget.weatherData['list'][3]['main']['temp']).toString());
//       temp5 = double.parse(( widget.weatherData['list'][4]['main']['temp']).toString());
//       temp6 = double.parse(( widget.weatherData['list'][5]['main']['temp']).toString());
//       temp7 = double.parse(( widget.weatherData['list'][6]['main']['temp']).toString());
//       temp8 = double.parse(( widget.weatherData['list'][7]['main']['temp']).toString());
//
//       /*Speed of air*/
//       speed1 =  widget.weatherData['list'][0]['wind']['speed'];
//       speed2 =  widget.weatherData['list'][1]['wind']['speed'];
//       speed3 =  widget.weatherData['list'][2]['wind']['speed'];
//       speed4 =  widget.weatherData['list'][3]['wind']['speed'];
//       speed5 =  widget.weatherData['list'][4]['wind']['speed'];
//       speed6 =  widget.weatherData['list'][5]['wind']['speed'];
//       speed7 =  widget.weatherData['list'][6]['wind']['speed'];
//       speed8 =  widget.weatherData['list'][7]['wind']['speed'];
//
// /*Time*/
//       DateTime? dateTime1 = DateTime.tryParse( widget.weatherData['list'][0]['dt_txt']);
//       time1 = DateFormat.jm().format(dateTime1!);
//       DateTime? dateTime2 = DateTime.tryParse( widget.weatherData['list'][1]['dt_txt']);
//       time2 = DateFormat.jm().format(dateTime2!);
//       DateTime? dateTime3 = DateTime.tryParse( widget.weatherData['list'][2]['dt_txt']);
//       time3 = DateFormat.jm().format(dateTime3!);
//       DateTime? dateTime4 = DateTime.tryParse( widget.weatherData['list'][3]['dt_txt']);
//       time4 = DateFormat.jm().format(dateTime4!);
//       DateTime? dateTime5 = DateTime.tryParse( widget.weatherData['list'][4]['dt_txt']);
//       time5 = DateFormat.jm().format(dateTime5!);
//       DateTime? dateTime6 = DateTime.tryParse( widget.weatherData['list'][5]['dt_txt']);
//       time6 = DateFormat.jm().format(dateTime6!);
//       DateTime? dateTime7 = DateTime.tryParse( widget.weatherData['list'][6]['dt_txt']);
//       time7 = DateFormat.jm().format(dateTime7!);
//       DateTime? dateTime8 = DateTime.tryParse( widget.weatherData['list'][7]['dt_txt']);
//       time8 = DateFormat.jm().format(dateTime8!);
//
//       /*Condition*/
//       condition1= widget.weatherData['list'][0]['weather'][0]['main'];
//       condition2= widget.weatherData['list'][1]['weather'][0]['main'];
//       condition3= widget.weatherData['list'][2]['weather'][0]['main'];
//       condition4= widget.weatherData['list'][3]['weather'][0]['main'];
//       condition5= widget.weatherData['list'][4]['weather'][0]['main'];
//       condition6= widget.weatherData['list'][5]['weather'][0]['main'];
//       condition7= widget.weatherData['list'][6]['weather'][0]['main'];
//       condition8= widget.weatherData['list'][7]['weather'][0]['main'];
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  widget.weatherData==null?Center(
//       child: CircularProgressIndicator(),
//     ):
//   }
// }
