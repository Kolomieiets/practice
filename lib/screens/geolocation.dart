import 'package:flutter/material.dart';
import 'package:practice_app/utils/pop_utils.dart';
import 'package:practice_app/widgets/drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return PopUtils.onWillPop(context);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Your geolocation')),
        drawer: const MyDrawer(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.location_on,
              size: 50.0,
              color: Colors.red,
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'Get user Location',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            _setLocationData(),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                _getLocation();
              },
              child: const Text('Get current Location'),
            ),
            ElevatedButton(
                onPressed: () async {
                  _getLocation();
                  final Uri url = Uri(
                    scheme: 'https',
                    path: 'google.pl/maps/@$_lat,$_long,21z',
                  );
                  await launchUrl(
                    url,
                  );
                },
                child: const Text('Open with Google Map'))
          ]),
        ),
      ),
    );
  }

  Widget _setLocationData() {
    if (_locationMessage.isEmpty && !_isLoading){
      return const SizedBox(height: 8.0);
      }

    if (_isLoading) return const CircularProgressIndicator();

    return Text(_locationMessage);
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    _isLoading = true;
    setState(() {});

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    await Geolocator.getCurrentPosition().then((value) {
      _lat = '${value.latitude}';
      _long = '${value.longitude}';
      _locationMessage = 'Lat. $_lat, Long. $_long';
    });

    _isLoading = false;

    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {});
  }
}
