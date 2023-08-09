import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/layouts/buttons_screen_layout.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/resources/app_contacts.dart';
import 'package:practice_app/presentation/screens/url_launcher_screen/mixin/launchers.dart';
import 'package:practice_app/presentation/widgets/drawer.dart';
import 'package:practice_app/resources/app_urls.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class UrlLauncherScreen extends StatelessWidget with Launchers {
  static const String routeName = '/url_launcher';
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(
        title: Text(
          DictionaryManager.instance.dictionaryUrlLauncherScreen.title,
        ),
      ),
      drawer: MyDrawer(),
      child: ButtonsScreenLayout(
        children: [
          ElevatedButton(
            onPressed: () {
              phoneCall(AppContacts.phoneNumber);
            },
            child: Text(
              DictionaryManager.instance.dictionaryUrlLauncherScreen.call,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              sms(AppContacts.phoneNumber);
            },
            child: Text(
              DictionaryManager.instance.dictionaryUrlLauncherScreen.sms,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              email(AppContacts.email);
            },
            child: Text(
              DictionaryManager.instance.dictionaryUrlLauncherScreen.email,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              linkInApp(AppUrls.webInApp);
            },
            child: Text(
              DictionaryManager.instance.dictionaryUrlLauncherScreen.urlInapp,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              linkInBrowser(AppUrls.wedInBrowser);
            },
            child: Text(
              DictionaryManager
                  .instance.dictionaryUrlLauncherScreen.urlInBrowser,
            ),
          ),
        ],
      ),
    );
  }
}
