import 'package:auto_route/auto_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:practice_app/presentation/screens/work_with_images_screen/screens/image_picker_screen/components/my_modal_bottom_sheet.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});
  static const String routeName = '/image_picker';

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DictionaryManager
              .instance.dictionaryWorkWithImagesScreen.changeAvatar,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: AppSizes.h16),
            _image == null
                ? CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: AppSizes.h150,
                    child: Image.asset(
                      'assets/images/avatar.png',
                      color: Colors.white,
                      height: AppSizes.h200,
                      width: AppSizes.w200,
                    ))
                : ClipOval(
                    child: Image.file(
                      _image!,
                      height: AppSizes.h300,
                      width: AppSizes.w300,
                      fit: BoxFit.cover,
                    ),
                  ),
            SizedBox(height: AppSizes.h32),
            SizedBox(
              width: AppSizes.w300,
              height: AppSizes.h50,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => MyModalBottomSheet(_pickImage));
                },
                child: Text(
                  DictionaryManager
                      .instance.dictionaryWorkWithImagesScreen.changeImage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    setState(() {
      _image = img;
      _showToast();
    });
  }

  void _showToast() => Fluttertoast.showToast(
        msg: DictionaryManager
            .instance.dictionaryWorkWithImagesScreen.imageChanged,
        gravity: ToastGravity.TOP_LEFT,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.grey,
      );
}
