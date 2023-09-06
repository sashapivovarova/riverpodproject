import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class MyLocation {
  double? latitude2;
  double? longitude2;

  MyLocation({
    this.latitude2,
    this.longitude2,
  });

  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude2 = position.latitude;
      longitude2 = position.longitude;
    } catch (e) {
      debugPrint('Error!');
    }
  }
}
