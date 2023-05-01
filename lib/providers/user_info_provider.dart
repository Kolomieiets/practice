import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice_app/screens/change_info_screen/storage_data.dart';

class UserInfoProvider with ChangeNotifier {
  String? name;
  String? surname;
  File? myImage;
  String? path;

  final String imageName = 'my_avatar.jpg';
  Map<String, dynamic> nameData = {};

  void init() async {
    await _getPath();
    await _getImage();
    await _getNameData();
    notifyListeners();
  }

  Future<void> _getNameData() async {
    nameData = await StorageData.getData();
  }

  void putNameData({
    required String name,
    required String surname,
  }) {
    nameData = {'name': name, 'surname': surname};
    StorageData.putData(nameData);
  }

  Future<void> _getPath() async {
    Directory directory = await getApplicationDocumentsDirectory();
    path = directory.path;
  }

  Future<void> _getImage() async {
    myImage = File(('$path/$imageName'));
    final bool? isExist = await myImage?.exists();
    if (isExist == null || !isExist) myImage = null;
  }

  Future<void> changeImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final File newImage = await File(image.path).copy('$path/$imageName');

    myImage = null;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 10));

    myImage = newImage;
    notifyListeners();
  }

  Future<void> deleteFile() async {
    if (await myImage!.exists()) {
      await myImage!.delete();
      myImage = null;
    }
    notifyListeners();
  }
}
