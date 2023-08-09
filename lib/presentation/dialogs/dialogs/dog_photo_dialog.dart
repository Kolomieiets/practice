import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/boundary/requests/facts/factRepository.dart';
import 'package:practice_app/presentation/dialogs/dialog_manager.dart';
import 'package:practice_app/presentation/layouts/dialog_layout.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';
import 'package:share_plus/share_plus.dart';

class DogPhotoDialog extends StatefulWidget {
  const DogPhotoDialog({super.key});

  @override
  State<DogPhotoDialog> createState() => _DogPhotoDialogState();
}

class _DogPhotoDialogState extends State<DogPhotoDialog> {
  String url = '';

  final factRepository = FactRepository();
  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Material(
        color: Colors.transparent,
        child: FutureBuilder(
          future: _getApiData(),
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
                Padding(
                    padding: EdgeInsets.only(
                        bottom: AppSizes.h32,
                        top: AppSizes.h8,
                        right: AppSizes.w32,
                        left: AppSizes.w32),
                    child: snapshot.connectionState == ConnectionState.done
                        ? CachedNetworkImage(
                            imageUrl: url,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Column(
                              children: [
                                Icon(
                                  Icons.error,
                                  size: AppSizes.h60,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppSizes.w8,
                                      vertical: AppSizes.h8),
                                  child: Text(
                                    DictionaryManager
                                        .instance.dictionaryErrors.oops,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : CircularProgressIndicator()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        DialogManager.instance.close(context);
                      },
                      child: Text(
                        DictionaryManager
                            .instance.dictionaryDialogs.dogPhotoCloseDialog,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Share.share(
                          '${DictionaryManager.instance.dictionaryDialogs.dogPhotoShare} $url',
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

  Future<void> _getApiData() async {
    url = await factRepository.dogPhoto();
  }
}
