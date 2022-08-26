import 'package:flutter/material.dart';

class AQI extends StatelessWidget {
  double height;
  AQI(this.height);

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
              height: height * 0.012,
              child: Image.asset("assets/images/icons/leaf.png"),
            ),
            Text(
              "AQI",
              style:
                  TextStyle(fontSize: height * 0.016, color: Color(0xffFDFDFD)),
            ),
            Text(
              "13",
              style:
                  TextStyle(fontSize: height * 0.016, color: Color(0xffFDFDFD)),
            ),
          ],
        ),
      ),
    );
  }
}
