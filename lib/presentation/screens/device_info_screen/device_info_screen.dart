import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/presentation/screens/device_info_screen/components/card_builder.dart';
import 'package:practice_app/presentation/screens/device_info_screen/mixins/init.dart';
import 'package:practice_app/resources/app_sizes.dart';
// import 'package:practice_app/resources/utomik_text.dart';
import 'package:practice_app/presentation/widgets/drawer.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';
// import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class DeviceInfoScreen extends StatefulWidget {
  static const String routeName = '/device_info';

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> with Init {
  StreamSubscription? connectivityResult;

  @override
  void initState() {
    connectivityResult = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      checkResult(result);
    });

    checkBatteryLevel();

    checkDevice();

    super.initState();
  }

  @override
  void dispose() {
    connectivityResult?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(
        title: Text(
          DictionaryManager.instance.dictionaryDeviceInfoScreen.title,
        ),
      ),
      drawer: MyDrawer(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w16, vertical: AppSizes.h16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardBuilder(
                  '${DictionaryManager.instance.dictionaryDeviceInfoScreen.yourDevice} ${allInfo}'),
              CardBuilder(
                  '${DictionaryManager.instance.dictionaryDeviceInfoScreen.connection} $connection'),
              CardBuilder(
                  '${DictionaryManager.instance.dictionaryDeviceInfoScreen.battery} $batteryLevel'),
              // SizedBox(
              //   height: 400,
              //   child: Markdown(
              //     data: checkText(utomikText),
              //     styleSheet: MarkdownStyleSheet(
              //       a: const TextStyle(
              //         color: Colors.red,
              //       ),
              //     ),
              //     onTapLink: (text, href, title) {
              //       if (href != null &&
              //           href.startsWith('https://www.utomik.com/games')) {
              //         launchUrl(Uri.parse(href));
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // String checkText(String oldText) {
  //   String newText = '';
  //   bool isLink = false;
  //   String link = '';

  //   for (int i = 0; i < oldText.length; ++i) {
  //     if (oldText[i] == '(') {
  //       isLink = true;
  //     } else if (oldText[i] == ')') {
  //       link += oldText[i];
  //       isLink = false;
  //       if (link.contains('utomik.com/games')) {
  //         newText += link;
  //         link = '';
  //       } else {
  //         newText = newText.replaceRange(
  //             newText.lastIndexOf('['), newText.lastIndexOf('[') + 1, '');
  //         newText = newText.replaceRange(
  //             newText.lastIndexOf(']'), newText.lastIndexOf(']') + 1, '');
  //         link = '';
  //       }
  //       continue;
  //     }

  //     if (isLink) {
  //       link += oldText[i];
  //     } else {
  //       newText += oldText[i];
  //     }
  //   }
  //   return newText;
  // }
}
