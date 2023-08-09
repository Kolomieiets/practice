import 'package:flutter/material.dart';
import 'package:practice_app/presentation/dialogs/dialog_manager.dart';
import 'package:practice_app/presentation/layouts/dialog_layout.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';
import 'package:share_plus/share_plus.dart';

class GetCurrentLocationDialog extends StatelessWidget {
  final String locationMessage;
  const GetCurrentLocationDialog({required this.locationMessage});

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
                child: Text(locationMessage)),
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
                      '${DictionaryManager.instance.dictionaryDialogs.geolocationShare} $locationMessage',
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
