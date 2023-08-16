import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/device_info_screen/device_info_screen.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

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
      allInfo +=
          '${DictionaryManager.instance.dictionaryDeviceInfoScreen.device} ${androidInfo.device}';
      allInfo += ' ${androidInfo.hardware}';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      allInfo = iosInfo.systemName!;
      allInfo += ' ${iosInfo.model}';
      allInfo +=
          '${DictionaryManager.instance.dictionaryDeviceInfoScreen.systemVersion} ${iosInfo.systemVersion}';
    }
    setState(() {});
  }

  void checkResult(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile) {
      connection = DictionaryManager
          .instance.dictionaryDeviceInfoScreen.mobileConnection;
    } else if (result == ConnectivityResult.wifi) {
      connection =
          DictionaryManager.instance.dictionaryDeviceInfoScreen.wifiConnection;
    } else if (result == ConnectivityResult.none) {
      connection =
          DictionaryManager.instance.dictionaryDeviceInfoScreen.noConnection;
    }
    setState(() {});
  }
}
