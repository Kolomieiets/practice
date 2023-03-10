import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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
      appBar: AppBar(title: const Text('Change avatar')),
      // drawer: const MyDrawer(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _image == null
                ? CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 150,
                    child: Image.asset(
                      'assets/images/avatar.png',
                      color: Colors.white,
                      height: 200,
                      width: 200,
                    ))
                : ClipOval(
                    child: Image.file(
                      _image!,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
            const SizedBox(height: 32),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 32),
                        ListTile(
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                            title: const Text('Add image from the gallery')),
                        const Divider(),
                        ListTile(
                            onTap: () {
                              _pickImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                            title: const Text('Add image from the camera')),
                        const SizedBox(height: 32),
                      ],
                    ),
                  );
                },
                child: const Text('Change image'),
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
        msg: 'Image has been changed',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.grey,
      );
}
