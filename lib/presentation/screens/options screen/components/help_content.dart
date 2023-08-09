import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/block_name.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/items_list.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/settings_list_item_content.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/white_block_layout.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class HelpContent extends StatelessWidget {
  const HelpContent({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteBlockLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlockName(DictionaryManager
                        .instance.dictionaryTelegramScreen.help,),
          ItemsList(
            SettingsListItemContent(
              DictionaryManager
                        .instance.dictionaryTelegramScreen.askQuestion,
              Icons.chat_bubble,
            ),
          ),
          Divider(
            indent: AppSizes.h24,
            height: AppSizes.h6,
          ),
          ItemsList(
            SettingsListItemContent(
              'FAQ',
              Icons.question_mark,
            ),
          ),
          Divider(
            indent: AppSizes.h24,
            height: AppSizes.h6,
          ),
          ItemsList(
            SettingsListItemContent(
              'Privacy Policy',
              Icons.privacy_tip,
            ),
          ),
          SizedBox(
            height: AppSizes.h8,
          )
        ],
      ),
    );
  }
}
