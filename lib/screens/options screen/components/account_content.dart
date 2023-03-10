import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/account_list_item_content.dart';
import 'package:practice_app/screens/options%20screen/components/block_name.dart';
import 'package:practice_app/screens/options%20screen/components/items_list.dart';
import 'package:practice_app/screens/options%20screen/components/my_telegram_user_info.dart';
import 'package:practice_app/screens/options%20screen/components/white_block_layout.dart';

class AccountContent extends StatelessWidget {
  const AccountContent({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteBlockLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlockName('Account'),
          ItemsList(
            AccountListItemContent(
              MyTelegramUserInfo.user.phoneNumber,
              'Tap to change phone number',
            ),
          ),
          Divider(
            indent: 24.0,
            height: 6.0,
          ),
          ItemsList(
            AccountListItemContent(
              MyTelegramUserInfo.user.username,
              'Username',
            ),
          ),
          Divider(
            indent: 24.0,
            height: 6.0,
          ),
          ItemsList(
            AccountListItemContent(
              'Bio',
              MyTelegramUserInfo.user.bio == null
                  ? 'Add a few words about yourself'
                  : MyTelegramUserInfo.user.bio!,
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
