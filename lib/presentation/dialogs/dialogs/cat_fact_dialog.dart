import 'package:flutter/material.dart';
import 'package:practice_app/boundary/requests/facts/factRepository.dart';
import 'package:practice_app/presentation/dialogs/dialog_manager.dart';
import 'package:practice_app/presentation/layouts/dialog_layout.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';
import 'package:share_plus/share_plus.dart';

class CatFactDialog extends StatefulWidget {
  CatFactDialog({super.key});

  @override
  State<CatFactDialog> createState() => _CatFactDialogState();
}

class _CatFactDialogState extends State<CatFactDialog> {
  Map<String, dynamic> fact = {};

  final factRepository = FactRepository();

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Material(
        color: Colors.transparent,
        child: FutureBuilder(
          future: getApiData(),
          builder: (context, snapshot) {
            return Column(
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
                Text(DictionaryManager.instance.dictionaryDialogs.catFactTitle),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: AppSizes.h32,
                      top: AppSizes.h8,
                      right: AppSizes.w32,
                      left: AppSizes.w32),
                  child: snapshot.connectionState == ConnectionState.done
                      ? Text(fact['fact'] == null
                          ? DictionaryManager.instance.dictionaryErrors.oops
                          : fact['fact'])
                      : CircularProgressIndicator(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        DialogManager.instance.close(context);
                      },
                      child: Text(DictionaryManager
                          .instance.dictionaryDialogs.catFactCloseDialog),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Share.share(
                          '${DictionaryManager.instance.dictionaryDialogs.catFactShare} ${fact['fact']}',
                        );
                      },
                      child: Icon(Icons.share),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.h16),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> getApiData() async {
    fact = await factRepository.catFact();
  }
}
