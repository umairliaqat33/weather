import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AtmosphereQuality extends StatelessWidget {
  double height;
  String title1;
  String title2;
  String title3;
  String result1;
  String result2;
  String result3;
  var alignment;

  AtmosphereQuality(this.height, this.result1, this.result2, this.result3, this.title1,
      this.title2, this.title3,this.alignment);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:alignment,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                style: TextStyle(
                  fontSize: height * 0.0175,
                  color: Colors.white,
                ),
              ),
              Text(
                result1,
                style: TextStyle(
                  fontSize: height * 0.03,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                style: TextStyle(
                  fontSize: height * 0.0175,
                  color: Colors.white,
                ),
              ),
              Text(
                result2,
                style: TextStyle(
                  fontSize: height * 0.03,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title3,
                style: TextStyle(
                  fontSize: height * 0.0175,
                  color: Colors.white,
                ),
              ),
              Text(
                result3,
                style: TextStyle(
                  fontSize: height * 0.03,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
