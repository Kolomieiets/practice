import 'package:flutter/material.dart';
import 'package:practice_app/providers/user_info_provider.dart';
import 'package:practice_app/screens/api_requests_screen/api_requests_screen.dart';
import 'package:practice_app/screens/calculator_screen/calculator_screen.dart';
import 'package:practice_app/screens/change_info_screen/change_info_screen.dart';
import 'package:practice_app/screens/chart_screen/chart_screen.dart';
import 'package:practice_app/screens/geolocation.dart';
import 'package:practice_app/screens/home_screen.dart';
import 'package:practice_app/screens/options%20screen/options_screen.dart';
import 'package:practice_app/screens/sensors_plus_screen.dart';
import 'package:practice_app/screens/shimmer_loading_screen.dart';
import 'package:practice_app/screens/monobank_ui/ui_monobank_list_screen.dart';
import 'package:practice_app/screens/url_launcher_screen.dart';
import 'package:practice_app/screens/device_info_screen/device_info_screen.dart';
import 'package:practice_app/screens/video_screen/video_screen.dart';
import 'package:practice_app/screens/work_with_images_screen.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    String? _name = Provider.of<UserInfoProvider>(context).nameData['name'] ?? 'Name';
    String? _surname =
        Provider.of<UserInfoProvider>(context).nameData['surname'] ?? 'Surname';

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.black),
              child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Provider.of<UserInfoProvider>(context).myImage ==
                                null
                            ? Image.asset(
                                'assets/images/avatar.png',
                                color: Colors.white,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                Provider.of<UserInfoProvider>(context).myImage!,
                                fit: BoxFit.cover,
                              ),
                      ),
                      title: Text(
                        '$_name $_surname',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _listItem(
                    title: 'Home screen',
                    subtitle: 'Work with drawer, flutter_local_notifications',
                    routeName: HomeScreen.routeName,
                    ctx: context),
                    const Divider(),
                _listItem(
                    title: 'Change user info',
                    subtitle: 'Work with storage',
                    routeName: ChangeInfoScreen.routeName,
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
                    subtitle: 'geolocator, google_maps_flutter',
                    routeName: GeolocationScreen.routeName,
                    ctx: context),
                const Divider(),
                _listItem(
                    title: 'Device info',
                    subtitle: 'Work with connectivity_plus, device_info_plus, flutter_device_type',
                    routeName: DeviceInfoScreen.routeName,
                    ctx: context),
                const Divider(),
                _listItem(
                    title: 'Skeleton loading animation',
                    subtitle: 'Work with skeleton, pull to refresh',
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
                    subtitle: 'Work with API requests, dio, cached_network_image',
                    routeName: ApiRequestsScreen.routeName,
                    ctx: context),
                const Divider(),
                _listItem(
                    title: 'Calculator',
                    subtitle: '',
                    routeName: CalculatorScreen.routeName,
                    ctx: context),
                const Divider(),
                _listItem(
                    title: 'Chart',
                    subtitle: 'Work with fl_chart',
                    routeName: ChartScreen.routeName,
                    ctx: context),
                    const Divider(),
                _listItem(
                    title: 'Video',
                    subtitle: 'Work with video_player, chewie',
                    routeName: VideoScreen.routeName,
                    ctx: context),
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
