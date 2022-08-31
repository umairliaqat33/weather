import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AQI extends StatelessWidget {
  double height;
  int aqi;

  AQI(this.height, this.aqi);

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
              height: height * 0.012,
              child: Image.asset("assets/images/icons/leaf_icon.png"),
            ),
            Text(
              "AQI  ",
              style:
                  TextStyle(fontSize: height * 0.016, color: Color(0xffFDFDFD)),
            ),
            Text(
              aqi.toString(),
              style:
                  TextStyle(fontSize: height * 0.016, color: Color(0xffFDFDFD)),
            ),
          ],
        ),
      ),
    );
  }
}
