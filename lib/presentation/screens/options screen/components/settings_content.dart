import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/block_name.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/items_list.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/settings_list_item_content.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/white_block_layout.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteBlockLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlockName(DictionaryManager
                        .instance.dictionaryTelegramScreen.settings,),
          ItemsList(
            SettingsListItemContent(
              DictionaryManager
                        .instance.dictionaryTelegramScreen.notificationsSounds,
              Icons.notifications,
            ),
          ),
          Divider(
            indent: AppSizes.h24,
            height:  AppSizes.h6,
          ),
          ItemsList(
            SettingsListItemContent(
              DictionaryManager
                        .instance.dictionaryTelegramScreen.privacySecurity,
              Icons.privacy_tip,
            ),
          ),
          Divider(
            indent: AppSizes.h24,
            height:  AppSizes.h6,
          ),
          ItemsList(
            SettingsListItemContent(
              DictionaryManager
                        .instance.dictionaryTelegramScreen.dataStorage,
              Icons.data_usage,
            ),
          ),
          Divider(
            indent: AppSizes.h24,
            height:  AppSizes.h6,
          ),
          ItemsList(
            SettingsListItemContent(
              DictionaryManager
                        .instance.dictionaryTelegramScreen.chatSettings,
              Icons.chat,
            ),
          ),
          Divider(
            indent: AppSizes.h24,
            height:  AppSizes.h6,
          ),
          ItemsList(
            SettingsListItemContent(
              DictionaryManager
                        .instance.dictionaryTelegramScreen.stickerEmoji,
              Icons.emoji_emotions,
            ),
          ),
          Divider(
            indent: AppSizes.h24,
            height:  AppSizes.h6,
          ),
          ItemsList(
            SettingsListItemContent(
              DictionaryManager
                        .instance.dictionaryTelegramScreen.folders,
              Icons.folder,
            ),
          ),
          Divider(
            indent: AppSizes.h24,
            height:  AppSizes.h6,
          ),
          ItemsList(
            SettingsListItemContent(
              DictionaryManager
                        .instance.dictionaryTelegramScreen.devices,
              Icons.devices,
            ),
          ),
          Divider(
            indent: AppSizes.h24,
            height:  AppSizes.h6,
          ),
          ItemsList(
            SettingsListItemContent(
              DictionaryManager
                        .instance.dictionaryTelegramScreen.language,
              Icons.language,
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
