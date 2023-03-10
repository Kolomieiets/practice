import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/block_name.dart';
import 'package:practice_app/screens/options%20screen/components/items_list.dart';
import 'package:practice_app/screens/options%20screen/components/settings_list_item_content.dart';
import 'package:practice_app/screens/options%20screen/components/white_block_layout.dart';

class HelpContent extends StatelessWidget {
  const HelpContent({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteBlockLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlockName('Help'),
          ItemsList(
            SettingsListItemContent(
              'Ask a Question',
              Icons.chat_bubble,
            ),
          ),
          Divider(
            indent: 24.0,
            height: 6.0,
          ),
          ItemsList(
            SettingsListItemContent(
              'FAQ',
              Icons.question_mark,
            ),
          ),
          Divider(
            indent: 24.0,
            height: 6.0,
          ),
          ItemsList(
            SettingsListItemContent(
              'Privacy Policy',
              Icons.privacy_tip,
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
