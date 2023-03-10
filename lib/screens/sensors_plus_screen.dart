import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practice_app/providers/accelerometer_provider.dart';
import 'package:practice_app/providers/gyroscope_provider.dart';
import 'package:practice_app/providers/magnetometer_provider.dart';
import 'package:practice_app/providers/userAccelerometer_provider.dart';
import 'package:practice_app/utils/pop_utils.dart';
import 'package:practice_app/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorsPlusScreen extends StatefulWidget {
  static const String routeName = '/sensors_plus';
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

    return WillPopScope(
      onWillPop: () {
        return PopUtils.onWillPop(context);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Sensors Plus')),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _cardItem(
                  'Accelerometer',
                  Consumer<AccelerometerProvider>(
                    builder: ((context, value, child) =>
                        Text(value.answer ?? '')),
                  ),
                  isAccelerometerPressed,
                  () => Provider.of<AccelerometerProvider>(
                    context,
                    listen: false,
                  ).changePressing(isAccelerometerPressed),
                ),
                _cardItem(
                  'User Accelerometer',
                  Consumer<UserAccelerometerProvider>(
                    builder: ((context, value, child) =>
                        Text(value.answer ?? '')),
                  ),
                  isUserAccelerometerPressed,
                  () => Provider.of<UserAccelerometerProvider>(
                    context,
                    listen: false,
                  ).changePressing(isUserAccelerometerPressed),
                ),
                _cardItem(
                  'Gyroscope',
                  Consumer<GyroscopeProvider>(
                    builder: ((context, value, child) =>
                        Text(value.answer ?? '')),
                  ),
                  isGyroscopePressed,
                  () => Provider.of<GyroscopeProvider>(
                    context,
                    listen: false,
                  ).changePressing(isGyroscopePressed),
                ),
                _cardItem(
                  'Magnetometer',
                  Consumer<MagnetometerProvider>(
                    builder: ((context, value, child) =>
                        Text(value.answer ?? '')),
                  ),
                  isMagnetometerPressed,
                  () => Provider.of<MagnetometerProvider>(
                    context,
                    listen: false,
                  ).changePressing(isMagnetometerPressed),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardItem(
    String name,
    Widget consumer,
    bool press,
    Function() changePress,
  ) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const Divider(),
          Container(
            alignment: Alignment.center,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                press ? consumer : const Text(''),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      changePress();
                      setState(() {});
                    },
                    child: Text(press ? 'Stop' : 'Start'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
