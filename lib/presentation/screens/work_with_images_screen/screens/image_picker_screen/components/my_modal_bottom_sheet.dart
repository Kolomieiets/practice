import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class MyModalBottomSheet extends StatelessWidget {
  final void Function(ImageSource image) pickImage;
  MyModalBottomSheet(this.pickImage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppSizes.h32),
        ListTile(
          onTap: () {
            pickImage(ImageSource.gallery);
            Navigator.of(context).pop();
          },
          title: Text(
            DictionaryManager.instance.dictionaryWorkWithImagesScreen.gallery,
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {
            pickImage(ImageSource.camera);
            Navigator.of(context).pop();
          },
          title: Text(
            DictionaryManager.instance.dictionaryWorkWithImagesScreen.camera,
          ),
        ),
        SizedBox(height: AppSizes.h32),
      ],
    );
  }
}
