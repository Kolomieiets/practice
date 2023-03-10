import 'package:flutter/material.dart';
import 'package:practice_app/layouts/buttons_screen_layout.dart';
import 'package:practice_app/screens/carousel_screen.dart';
import 'package:practice_app/screens/image_picker_screen.dart';
import 'package:practice_app/utils/pop_utils.dart';
import 'package:practice_app/widgets/drawer.dart';

class WorkWithImages extends StatelessWidget {
  static const String routeName = '/work_with_images_screen';
  const WorkWithImages({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return PopUtils.onWillPop(context);
      },
      child: Scaffold(
          appBar: AppBar(title: const Text('Work with images')),
          drawer: const MyDrawer(),
          body: ButtonsScreenLayout(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ImagePickerScreen.routeName);
                },
                child: const Text('Change avatar'),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CarouselScreen.routeName);
                },
                child: const Text('Make carousel'),
              ),
            ],
          )),
    );
  }
}
