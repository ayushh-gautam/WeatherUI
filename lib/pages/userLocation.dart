// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_local_variable, avoid_print

import 'package:geolocator/geolocator.dart';

class UserLocation {
  double? latitude;
  double? longitude;
  UserLocation({this.latitude, this.longitude});

  Future getLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      permission = await Geolocator.checkPermission();

      Position userPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = userPosition.latitude;
      longitude = userPosition.longitude;
      return await Geolocator.getCurrentPosition();
    } catch (exception) {
      print(exception);
    }
  }
}
