import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/block_name.dart';
import 'package:practice_app/screens/options%20screen/components/items_list.dart';
import 'package:practice_app/screens/options%20screen/components/settings_list_item_content.dart';
import 'package:practice_app/screens/options%20screen/components/white_block_layout.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteBlockLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlockName('Settings'),
          ItemsList(
            SettingsListItemContent(
              'Notifications and Sounds',
              Icons.notifications,
            ),
          ),
          Divider(
            indent: 24.0,
            height: 6.0,
          ),
          ItemsList(
            SettingsListItemContent(
              'Privacy and security',
              Icons.privacy_tip,
            ),
          ),
          Divider(
            indent: 24.0,
            height: 6.0,
          ),
          ItemsList(
            SettingsListItemContent(
              'Data and Storage',
              Icons.data_usage,
            ),
          ),
          Divider(
            indent: 24.0,
            height: 6.0,
          ),
          ItemsList(
            SettingsListItemContent(
              'Chat Settings',
              Icons.chat,
            ),
          ),
          Divider(
            indent: 24.0,
            height: 6.0,
          ),
          ItemsList(
            SettingsListItemContent(
              'Sticker and Emoji',
              Icons.emoji_emotions,
            ),
          ),
          Divider(
            indent: 24.0,
            height: 6.0,
          ),
          ItemsList(
            SettingsListItemContent(
              'Folders',
              Icons.folder,
            ),
          ),
          Divider(
            indent: 24.0,
            height: 6.0,
          ),
          ItemsList(
            SettingsListItemContent(
              'Devices',
              Icons.devices,
            ),
          ),
          Divider(
            indent: 24.0,
            height: 6.0,
          ),
          ItemsList(
            SettingsListItemContent(
              'Language',
              Icons.language,
            ),
          ),
          SizedBox(
            height: 8.0,
          )
        ],
      ),
    );
  }
}
