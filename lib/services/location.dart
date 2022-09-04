import 'dart:io';

import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  Future getCurrentLocation() async {
    try {
      PermissionStatus locationPermission = await Permission.location.request();
      if (locationPermission.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        return position;
      } else if (locationPermission.isDenied) {
        Fluttertoast.showToast(msg: "Location permission required please try again");
        await Future.delayed(Duration(seconds: 2));
        exit(0);
        SystemNavigator.pop();
      }else if(locationPermission.isPermanentlyDenied){
        Fluttertoast.showToast(msg: "Location permission required please try again in settings");
        await Future.delayed(Duration(seconds: 2));
        openAppSettings();
      }
    } catch (e) {
      print(e);
    }
  }
}