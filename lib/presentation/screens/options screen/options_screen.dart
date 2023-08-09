import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/account_content.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/help_content.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/custom_sliver_appbar_delegate.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/number_confirmation.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/premium_content.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/settings_content.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class OptionsScreen extends StatelessWidget {
  static const String routeName = '/options';

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: CustomScrollView(
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
                          height: AppSizes.h50,
                          child: Text(
                            '${DictionaryManager
                        .instance.dictionaryTelegramScreen.telegramFor} ${_text()}',
                            style: TextStyle(color: AppTextStyle.colorGrey,),
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
