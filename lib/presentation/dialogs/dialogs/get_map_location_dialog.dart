import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:practice_app/presentation/dialogs/dialog_manager.dart';
import 'package:practice_app/presentation/layouts/dialog_layout.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';
import 'package:share_plus/share_plus.dart';

class GetMapLocationDialog extends StatelessWidget {
  final String lat;
  final String long;
  const GetMapLocationDialog({required this.lat, required this.long});

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    DialogManager.instance.close(context);
                  },
                  icon: Icon(Icons.clear),
                ),
              ],
            ),
            Text(
              DictionaryManager.instance.dictionaryDialogs.geolocationTitle,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: AppSizes.h32,
                  top: AppSizes.h8,
                  right: AppSizes.w32,
                  left: AppSizes.w32),
              child: SizedBox(
                height: AppSizes.h200,
                child: GoogleMap(
                  markers: {
                    Marker(
                      markerId: MarkerId('origin'),
                      position: LatLng(
                        double.parse(lat),
                        double.parse(long),
                      ),
                    )
                  },
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      double.parse(lat),
                      double.parse(long),
                    ),
                    zoom: 15,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    DialogManager.instance.close(context);
                  },
                  child: Text(
                    DictionaryManager.instance.dictionaryDialogs.ok,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Share.share(
                      '${DictionaryManager.instance.dictionaryDialogs.geolocationShare} Lat. $lat, Long. $long',
                    );
                  },
                  child: Icon(Icons.share),
                ),
              ],
            ),
            SizedBox(height: AppSizes.h16),
          ],
        ),
      ),
    );
  }
}
