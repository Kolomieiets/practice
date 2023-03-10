import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/account_content.dart';
import 'package:practice_app/screens/options%20screen/components/help_content.dart';
import 'package:practice_app/screens/options%20screen/components/custom_sliver_appbar_delegate.dart';
import 'package:practice_app/screens/options%20screen/components/number_confirmation.dart';
import 'package:practice_app/screens/options%20screen/components/premium_content.dart';
import 'package:practice_app/screens/options%20screen/components/settings_content.dart';

class OptionsScreen extends StatelessWidget {
  static const String routeName = '/options';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            pinned: true,
            delegate: CustomSliverAppBarDelegate(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ColoredBox(
                  color: Color.fromARGB(255, 243, 243, 243),
                  child: Column(
                    children: [
                      AccountContent(),
                      NumberConfirmation(),
                      SettingsContent(),
                      PremiumContent(),
                      HelpContent(),
                      SizedBox(
                        height: 50,
                        child: Text(
                          'Telegram for ${_text()}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _text() {
    String text = '';
    String info;
    if (Platform.isAndroid) {
      info = Platform.operatingSystemVersion;
      text = 'Android $info';
    } else if (Platform.isIOS) {
      info = Platform.operatingSystemVersion;
      text = 'IOS $info';
    }
    return text;
  }
}
