import 'package:flutter/material.dart';
import 'package:practice_app/providers/user_info_provider.dart';
import 'package:practice_app/screens/change_info_screen/components/name_text_fields.dart';
import 'package:practice_app/widgets/drawer.dart';
import 'package:provider/provider.dart';

class ChangeInfoScreen extends StatefulWidget {
  static const String routeName = '/change_info';
  const ChangeInfoScreen({super.key});

  @override
  State<ChangeInfoScreen> createState() => _ChangeInfoScreenState();
}

class _ChangeInfoScreenState extends State<ChangeInfoScreen> {
  bool isFirstTime = true;
  late final UserInfoProvider provider;

  @override
  Widget build(BuildContext context) {
    if (isFirstTime) {
      provider = Provider.of<UserInfoProvider>(context);
      isFirstTime = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Change your information'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(300),
                color: Colors.grey,
              ),
              child: provider.myImage == null
                  ? Image.asset('assets/images/avatar.png',
                      fit: BoxFit.cover, color: Colors.white)
                  : Image(
                      fit: BoxFit.cover,
                      image: FileImage(provider.myImage!),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    provider.changeImage();
                  },
                  child: Text('Change image'),
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.deleteFile();
                  },
                  child: Text('Delete image'),
                )
              ],
            ),
            SizedBox(height: 32.0),
            NameTextFields(),
          ],
        ),
      ),
    );
  }
}
