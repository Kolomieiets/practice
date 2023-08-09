import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/sensors_plus_screen/sensors_plus_screen.dart';
import 'package:practice_app/providers/provider/accelerometer_provider.dart';
import 'package:practice_app/providers/provider/gyroscope_provider.dart';
import 'package:practice_app/providers/provider/magnetometer_provider.dart';
import 'package:practice_app/providers/provider/userAccelerometer_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProvidersInitScreen extends StatelessWidget {
  
  static const String routeName = '/sensors_plus';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AccelerometerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserAccelerometerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GyroscopeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MagnetometerProvider(),
        ),
      ],
      child: SensorsPlusScreen(),
    );
  }
}
