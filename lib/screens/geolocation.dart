import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:practice_app/screens/api_requests_screen/components/popup_content.dart';
import 'package:practice_app/screens/api_requests_screen/components/popup_layout.dart';
import 'package:practice_app/utils/pop_utils.dart';
import 'package:practice_app/widgets/drawer.dart';
import 'package:geolocator/geolocator.dart';

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
  void initState() {
    _getLocation();
    super.initState();
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return showPopUp();
                    },
                  );
                },
                child: const Text('Get current Location'),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return showMap();
                    },
                  );
                },
                child: const Text('Show on map'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showMap() {
    return PopUpLayout(
      child: PopUpContent(
        buttonText: 'Ok',
        title: 'Your current location!',
        sharingText: 'My location! $_locationMessage',
        child: SizedBox(
          height: 200,
          child: GoogleMap(
            markers: {Marker(markerId: MarkerId('origin'), position: LatLng(
                double.parse(_lat),
                double.parse(_long),
              ),)},
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                double.parse(_lat),
                double.parse(_long),
              ),
              zoom: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget showPopUp() {
    return PopUpLayout(
      child: PopUpContent(
        buttonText: 'Ok',
        title: 'Your current location!',
        sharingText: 'My location! $_locationMessage',
        child: Text(_locationMessage),
      ),
    );
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
