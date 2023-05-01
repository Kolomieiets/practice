import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/screens/device_info_screen/components/card_builder.dart';
import 'package:practice_app/screens/device_info_screen/mixins/init.dart';
import 'package:practice_app/utils/pop_utils.dart';
import 'package:practice_app/widgets/drawer.dart';

class DeviceInfoScreen extends StatefulWidget {
  static const String routeName = '/device_info';

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> with Init {
  StreamSubscription? connectivityResult;

  @override
  void initState() {
    // Connectivity().checkConnectivity().then((value) => checkResult(value));
    connectivityResult = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      checkResult(result);
    });

    checkBatteryLevel();

    checkDevice();

    super.initState();
  }

  @override
  void dispose() {
    connectivityResult?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return PopUtils.onWillPop(context);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Device info')),
        drawer: const MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardBuilder('Your device: ${allInfo}'),
              CardBuilder('Connection: $connection'),
              CardBuilder('Battery level: $batteryLevel'),
            ],
          ),
        ),
      ),
    );
  }
}
