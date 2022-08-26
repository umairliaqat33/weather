import 'package:flutter/material.dart';

class AirQuality extends StatelessWidget {
  double height;

  AirQuality(this.height);

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
              fontSize: height * 0.0175,
            ),
          ),
          Row(
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
                          child: Image.asset("assets/images/icons/leaf.png"),
                        ),
                      ),
                      TextSpan(
                        text: "17",
                        style: TextStyle(
                          fontSize: height * 0.03,
                          color: Colors.white,
                        ),
                      )
                    ]),
              ),
              Text(
                "Full air quality forecast",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height * 0.0175,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
