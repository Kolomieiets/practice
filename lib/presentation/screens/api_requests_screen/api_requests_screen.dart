import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/dialogs/dialogs/cat_fact_dialog.dart';
import 'package:practice_app/presentation/dialogs/dialog_manager.dart';
import 'package:practice_app/presentation/dialogs/dialogs/dog_photo_dialog.dart';
import 'package:practice_app/presentation/layouts/buttons_screen_layout.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/presentation/widgets/drawer.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class ApiRequestsScreen extends StatefulWidget {
  static const String routeName = '/api_requests';

  @override
  State<ApiRequestsScreen> createState() => _ApiRequestsScreenState();
}

class _ApiRequestsScreenState extends State<ApiRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(
        title: Text(
          DictionaryManager.instance.dictionaryApiScreen.title,
        ),
      ),
      drawer: MyDrawer(),
      child: ButtonsScreenLayout(
        children: [
          SizedBox(
            width: AppSizes.w100,
            child: ElevatedButton(
              onPressed: () {
                DialogManager.instance.show(
                  context: context,
                  child: CatFactDialog(),
                );
              },
              child: Text(
                DictionaryManager.instance.dictionaryApiScreen.buttonCat,
                style: TextStyle(
                  fontSize: AppTextStyle.font14,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              DialogManager.instance.show(
                context: context,
                child: DogPhotoDialog(),
              );
            },
            child: Text(
              DictionaryManager.instance.dictionaryApiScreen.buttonDog,
              style: TextStyle(
                fontSize: AppTextStyle.font14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
