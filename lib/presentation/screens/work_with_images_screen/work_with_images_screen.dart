import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/config/auto_router.dart';
import 'package:practice_app/presentation/layouts/buttons_screen_layout.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/presentation/screens/work_with_images_screen/screens/carousel_screen/carousel_screen.dart';
import 'package:practice_app/presentation/screens/work_with_images_screen/screens/image_picker_screen/image_picker_screen.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/presentation/widgets/drawer.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class WorkWithImagesScreen extends StatelessWidget {
  static const String routeName = '/work_with_images_screen';
  const WorkWithImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(
        title: Text(
          DictionaryManager.instance.dictionaryWorkWithImagesScreen.title,
        ),
      ),
      drawer: MyDrawer(),
      child: ButtonsScreenLayout(
        children: [
          ElevatedButton(
            onPressed: () {
              AppRouter.instance.pushNamed(ImagePickerScreen.routeName);
            },
            child: Text(
              DictionaryManager
                  .instance.dictionaryWorkWithImagesScreen.changeAvatar,
            ),
          ),
          SizedBox(height: AppSizes.h16),
          ElevatedButton(
            onPressed: () {
              AppRouter.instance.pushNamed(CarouselScreen.routeName);
            },
            child: Text(
              DictionaryManager
                  .instance.dictionaryWorkWithImagesScreen.makeCarousel,
            ),
          ),
        ],
      ),
    );
  }
}
