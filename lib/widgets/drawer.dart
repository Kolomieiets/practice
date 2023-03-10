import 'package:flutter/material.dart';
import 'package:practice_app/screens/api_requests_screen/api_requests_screen.dart';
import 'package:practice_app/screens/change_info_screen/change_info_screen.dart';
import 'package:practice_app/screens/geolocation.dart';
import 'package:practice_app/screens/home_screen.dart';
import 'package:practice_app/screens/options%20screen/options_screen.dart';
import 'package:practice_app/screens/sensors_plus_screen.dart';
import 'package:practice_app/screens/shimmer_loading_screen.dart';
import 'package:practice_app/screens/monobank_ui/ui_monobank_list_screen.dart';
import 'package:practice_app/screens/url_launcher_screen.dart';
import 'package:practice_app/screens/videos_screen.dart';
import 'package:practice_app/screens/work_with_images_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 120,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                'What have I learned',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _listItem(
                    title: 'Home screen',
                    subtitle: 'Work with drawer',
                    routeName: HomeScreen.routeName,
                    ctx: context),
                const Divider(),
                _listItem(
                    title: 'Work with launching url',
                    subtitle: 'urlLauncher',
                    routeName: UrlLauncherScreen.routeName,
                    ctx: context),
                const Divider(),
                _listItem(
                    title: 'Work with images',
                    subtitle: 'imagePicker, flutterToast, carousel',
                    routeName: WorkWithImages.routeName,
                    ctx: context),
                const Divider(),
                _listItem(
                    title: 'Geolocation',
                    subtitle: 'geolocator, map',
                    routeName: GeolocationScreen.routeName,
                    ctx: context),
                const Divider(),
                _listItem(
                    title: 'Videos',
                    subtitle: 'Work with videos',
                    routeName: VideosScreen.routeName,
                    ctx: context),
                const Divider(),
                _listItem(
                    title: 'Shimmer loading animation',
                    subtitle: 'Work with shimmer, dotted_border',
                    routeName: ShimmerLoadingScreen.routeName,
                    ctx: context),
                const Divider(),
                _listItem(
                    title: 'Sensors plus',
                    subtitle:
                        'Work with accelerometer, gyroscope, magnetometer',
                    routeName: SensorsPlusScreen.routeName,
                    ctx: context),
                const Divider(),
                ListTile(
                  title: Text('UI monobank'),
                  subtitle: Text('Work with UI'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pushNamed(UiMonobankListScreen.routeName);
                  },
                ),
                const Divider(),
                ListTile(
                  title: Text('Ooptions ui'),
                  subtitle: Text('Work with UI'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(OptionsScreen.routeName);
                  },
                ),
                const Divider(),
                _listItem(
                    title: 'API',
                    subtitle:
                        'Work with API requests',
                    routeName: ApiRequestsScreen.routeName,
                    ctx: context),
                const Divider(),
                _listItem(
                    title: 'Change user info',
                    subtitle: 'Work with storage',
                    routeName: ChangeInfoScreen.routeName,
                    ctx: context),
                const Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _listItem({
    required String title,
    required String subtitle,
    required String routeName,
    required BuildContext ctx,
  }) {
    return ListTile(
      onTap: () {
        Navigator.of(ctx).pushReplacementNamed(routeName);
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
