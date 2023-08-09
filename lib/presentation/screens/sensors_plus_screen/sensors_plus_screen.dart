import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/presentation/screens/sensors_plus_screen/components/card_item.dart';
import 'package:practice_app/providers/provider/accelerometer_provider.dart';
import 'package:practice_app/providers/provider/gyroscope_provider.dart';
import 'package:practice_app/providers/provider/magnetometer_provider.dart';
import 'package:practice_app/providers/provider/userAccelerometer_provider.dart';
import 'package:practice_app/presentation/widgets/drawer.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorsPlusScreen extends StatefulWidget {
  const SensorsPlusScreen({super.key});

  @override
  State<SensorsPlusScreen> createState() => _SensorsPlusScreenState();
}

class _SensorsPlusScreenState extends State<SensorsPlusScreen> {
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      Provider.of<AccelerometerProvider>(context, listen: false)
          .setAccelerometerData(event.x, event.y, event.z);
    }));

    _streamSubscriptions
        .add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      Provider.of<UserAccelerometerProvider>(context, listen: false)
          .setUserAccelerometerData(event.x, event.y, event.z);
    }));

    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      Provider.of<GyroscopeProvider>(context, listen: false)
          .setGyroscopeData(event.x, event.y, event.z);
    }));

    _streamSubscriptions
        .add(magnetometerEvents.listen((MagnetometerEvent event) {
      Provider.of<MagnetometerProvider>(context, listen: false)
          .setMagnetometerData(event.x, event.y, event.z);
    }));
    super.initState();
  }

  @override
  void dispose() {
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isAccelerometerPressed =
        Provider.of<AccelerometerProvider>(context, listen: false).isPressed;
    bool isUserAccelerometerPressed =
        Provider.of<UserAccelerometerProvider>(context, listen: false)
            .isPressed;
    bool isGyroscopePressed =
        Provider.of<GyroscopeProvider>(context, listen: false).isPressed;
    bool isMagnetometerPressed =
        Provider.of<MagnetometerProvider>(context, listen: false).isPressed;

    return MainLayout(
      appBar: AppBar(
        title: Text(
          DictionaryManager.instance.dictionarySensorsPlusScreen.title,
        ),
      ),
      drawer: MyDrawer(),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardItem(
                name: DictionaryManager
                        .instance.dictionarySensorsPlusScreen.accelerometer,
                consumer: Consumer<AccelerometerProvider>(
                  builder: ((context, value, child) =>
                      Text(value.answer ?? '')),
                ),
                press: isAccelerometerPressed,
                changePress: () => Provider.of<AccelerometerProvider>(
                  context,
                  listen: false,
                ).changePressing(isAccelerometerPressed),
                mySetState: () {
                  setState(() {});
                },
              ),
              CardItem(
                name: DictionaryManager
                        .instance.dictionarySensorsPlusScreen.user_accelerometer,
                consumer: Consumer<UserAccelerometerProvider>(
                  builder: ((context, value, child) =>
                      Text(value.answer ?? '')),
                ),
                press: isUserAccelerometerPressed,
                changePress: () => Provider.of<UserAccelerometerProvider>(
                  context,
                  listen: false,
                ).changePressing(isUserAccelerometerPressed),
                mySetState: () {
                  setState(() {});
                },
              ),
              CardItem(
                name: DictionaryManager
                        .instance.dictionarySensorsPlusScreen.gyroscope,
                consumer: Consumer<GyroscopeProvider>(
                  builder: ((context, value, child) =>
                      Text(value.answer ?? '')),
                ),
                press: isGyroscopePressed,
                changePress: () => Provider.of<GyroscopeProvider>(
                  context,
                  listen: false,
                ).changePressing(isGyroscopePressed),
                mySetState: () {
                  setState(() {});
                },
              ),
              CardItem(
                name: DictionaryManager
                        .instance.dictionarySensorsPlusScreen.magnetometer,
                consumer: Consumer<MagnetometerProvider>(
                  builder: ((context, value, child) =>
                      Text(value.answer ?? '')),
                ),
                press: isMagnetometerPressed,
                changePress: () => Provider.of<MagnetometerProvider>(
                  context,
                  listen: false,
                ).changePressing(isMagnetometerPressed),
                mySetState: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
