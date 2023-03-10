import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_app/providers/accelerometer_provider.dart';
import 'package:practice_app/providers/gyroscope_provider.dart';
import 'package:practice_app/providers/magnetometer_provider.dart';
import 'package:practice_app/providers/userAccelerometer_provider.dart';
import 'package:practice_app/screens/api_requests_screen/api_requests_screen.dart';
import 'package:practice_app/screens/carousel_screen.dart';
import 'package:practice_app/screens/geolocation.dart';
import 'package:practice_app/screens/home_screen.dart';
import 'package:practice_app/screens/image_picker_screen.dart';
import 'package:practice_app/screens/options%20screen/options_screen.dart';
import 'package:practice_app/screens/sensors_plus_screen.dart';
import 'package:practice_app/screens/shimmer_loading_screen.dart';
import 'package:practice_app/screens/monobank_ui/ui_monobank_list_screen.dart';
import 'package:practice_app/screens/url_launcher_screen.dart';
import 'package:practice_app/screens/videos_screen.dart';
import 'package:practice_app/screens/work_with_images_screen.dart';
import 'package:provider/provider.dart';

import 'screens/change_info_screen/change_info_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const int blackPrimaryValue = 0xFF000000;
  final MaterialColor primaryBlack = const MaterialColor(
    blackPrimaryValue,
    {
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccelerometerProvider()),
        ChangeNotifierProvider(create: (context) => UserAccelerometerProvider()),
        ChangeNotifierProvider(create: (context) => GyroscopeProvider()),
        ChangeNotifierProvider(create: (context) => MagnetometerProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: primaryBlack,
        ),
        home: const HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          ImagePickerScreen.routeName: (context) => const ImagePickerScreen(),
          UrlLauncherScreen.routeName: (context) => UrlLauncherScreen(),
          GeolocationScreen.routeName: (context) => const GeolocationScreen(),
          WorkWithImages.routeName: (context) => const WorkWithImages(),
          CarouselScreen.routeName: (context) => const CarouselScreen(),
          VideosScreen.routeName: (context) => const VideosScreen(),
          ShimmerLoadingScreen.routeName: (context) => const ShimmerLoadingScreen(),
          SensorsPlusScreen.routeName: (context) => const SensorsPlusScreen(),
          UiMonobankListScreen.routeName:(context) => const UiMonobankListScreen(),
          // MyAppBar.routeName:(context) => const MyAppBar(),
          OptionsScreen.routeName:(context) => OptionsScreen(),
          ApiRequestsScreen.routeName:(context) => ApiRequestsScreen(),
          ChangeInfoScreen.routeName:(context) => ChangeInfoScreen(),
        },
      ),
    );
  }
}
