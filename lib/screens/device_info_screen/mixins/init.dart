import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/screens/device_info_screen/device_info_screen.dart';

mixin Init<T extends StatefulWidget> on State<DeviceInfoScreen> {
  String connection = '';
  String allInfo = '';
  String batteryLevel = '';

  void checkBatteryLevel() async {
    batteryLevel = '${await Battery().batteryLevel}';
  }

  void checkDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      allInfo = androidInfo.brand;
      allInfo += ' ${androidInfo.model}';
      allInfo += '. Device: ${androidInfo.device}';
      allInfo += ' ${androidInfo.hardware}';
    } else if (Platform.isAndroid) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      allInfo = iosInfo.systemName!;
      allInfo += ' ${iosInfo.model}';
      allInfo += '. System version: ${iosInfo.systemVersion}';
    }
    setState(() {});
  }

  void checkResult(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile) {
      connection = 'Device connected to a mobile network.';
    } else if (result == ConnectivityResult.wifi) {
      connection = 'Device connected to a wi-fi network.';
    } else if (result == ConnectivityResult.none) {
      connection = 'Device does not connect to network.';
    }
    setState(() {});
  }
}
