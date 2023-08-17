import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:practice_app/config/injection_config.dart';
import 'package:practice_app/presentation/layouts/buttons_screen_layout.dart';
import 'package:practice_app/services/notifications_service/notofication_service.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/presentation/screens/home_screen/components/my_rating_bar.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';
import 'package:practice_app/presentation/widgets/drawer.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(DictionaryManager.instance.dictionaryHomeScreen.title),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DictionaryManager.instance.dictionaryHomeScreen.content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppTextStyle.font30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSizes.h32),
              ButtonsScreenLayout(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await Permission.notification.isDenied.then((value) {
                        if (value) {
                          Permission.notification.request();
                        }
                      });
                      await getIt<NotificationService>().showNotifications(
                        title: DictionaryManager.instance.dictionaryHomeScreen.reminder,
                        body: DictionaryManager.instance.dictionaryHomeScreen.notification,
                      );
                    },
                    child: Text(
                      DictionaryManager
                          .instance.dictionaryHomeScreen.buttonNotification,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.h32),
              Text(DictionaryManager.instance.dictionaryHomeScreen.ratingTitle,
                  style: TextStyle(
                      fontSize: AppTextStyle.font20,
                      color: AppTextStyle.colorGrey)),
              SizedBox(height: AppSizes.h32),
              MyRatingBar(),
            ],
          ),
        ),
      ),
    );
  }
}
