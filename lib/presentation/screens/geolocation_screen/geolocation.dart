import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/dialogs/dialog_manager.dart';
import 'package:practice_app/presentation/dialogs/dialogs/get_current_location_dialog.dart';
import 'package:practice_app/presentation/dialogs/dialogs/get_map_location_dialog.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/presentation/screens/geolocation_screen/components/buttons.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';
import 'package:practice_app/presentation/widgets/drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class GeolocationScreen extends StatefulWidget {
  static const String routeName = '/geolocation';
  const GeolocationScreen({super.key});

  @override
  State<GeolocationScreen> createState() => _GeolocationScreenState();
}

class _GeolocationScreenState extends State<GeolocationScreen> {
  String _lat = '';
  String _long = '';
  String _locationMessage = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getLocation());
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(
        title: Text(
          DictionaryManager.instance.dicitionaryGeolocationScreen.title,
        ),
      ),
      drawer: MyDrawer(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: AppSizes.h50,
              color: Colors.red,
            ),
            SizedBox(
              height: AppSizes.h16,
            ),
            Text(
              DictionaryManager.instance.dicitionaryGeolocationScreen.title,
              style: TextStyle(
                fontSize: AppTextStyle.font30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSizes.h16),
            MyButton(
              isLoading: _isLoading,
              text: DictionaryManager
                  .instance.dicitionaryGeolocationScreen.buttonGetLocation,
              onTap: () {
                DialogManager.instance.show(
                  context: context,
                  child: GetCurrentLocationDialog(
                      locationMessage: _locationMessage),
                );
              },
            ),
            SizedBox(height: AppSizes.h16),
            MyButton(
              isLoading: _isLoading,
              text: DictionaryManager
                  .instance.dicitionaryGeolocationScreen.buttonShowMap,
              onTap: () {
                DialogManager.instance.show(
                  context: context,
                  child: GetMapLocationDialog(
                    lat: _lat,
                    long: _long,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(
        DictionaryManager.instance.dictionaryErrors.locationDisabled,
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(
          DictionaryManager.instance.dictionaryErrors.locationPermission,
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        DictionaryManager.instance.dictionaryErrors.locationPermissionDenied,
      );
    }

    await Geolocator.getCurrentPosition().then((value) {
      _lat = '${value.latitude}';
      _long = '${value.longitude}';
      _locationMessage = 'Lat. $_lat, Long. $_long';
    });

    _isLoading = false;

    setState(() {});
  }
}
