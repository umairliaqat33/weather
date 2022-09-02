import 'package:flutter/material.dart';

alertDialogue(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          title: Text("Alert"),
          content: Text("You entered wrong name. Please try again"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Retry",style: TextStyle(
                  color: Colors.black,
                ),)),
          ],
        );
      });
}
