import 'package:flutter/material.dart';
import 'package:practice_app/utils/date_time_utils.dart';
import 'package:practice_app/utils/string_utils.dart';

class UserAccelerometerProvider with ChangeNotifier{
  String? answer;
  DateTime? time1;
  bool isPressed = false;

  void setUserAccelerometerData(double x, double y, double z) {
    if (time1 != null) {
      Duration difference = DateTimeUtils.difference(time1!);
      if (difference.inSeconds < 1) {
        return;
      }
    }
    time1 = DateTime.now();
    answer = answer = StringUtils.getString(x, y, z);
    notifyListeners();
  }

  void changePressing(bool press) {
  isPressed = !press;
  notifyListeners();
}
}