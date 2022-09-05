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
        Position position=Position(longitude: 74.329376, latitude:  31.582045, timestamp: null, accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1);
        return position;
      }else if(locationPermission.isPermanentlyDenied){
        Position position=Position(longitude: 74.329376, latitude:  31.582045, timestamp: null, accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1);
        return position;
      }
    } catch (e) {
      print(e);
    }
  }
}