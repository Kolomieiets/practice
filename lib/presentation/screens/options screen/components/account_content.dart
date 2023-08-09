import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/account_list_item_content.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/block_name.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/items_list.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/my_telegram_user_info.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/white_block_layout.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class AccountContent extends StatelessWidget {
  const AccountContent({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteBlockLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlockName(
            DictionaryManager.instance.dictionaryTelegramScreen.account,
          ),
          ItemsList(
            AccountListItemContent(
              MyTelegramUserInfo.user.phoneNumber,
              DictionaryManager
                        .instance.dictionaryTelegramScreen.changePhone,
            ),
          ),
          Divider(
            indent: AppSizes.h24,
            height: AppSizes.h6,
          ),
          ItemsList(
            AccountListItemContent(
              MyTelegramUserInfo.user.username,
              DictionaryManager
                        .instance.dictionaryTelegramScreen.username,
            ),
          ),
          Divider(
            indent: AppSizes.h24,
            height: AppSizes.h6,
          ),
          ItemsList(
            AccountListItemContent(
              DictionaryManager
                        .instance.dictionaryTelegramScreen.bio,
              MyTelegramUserInfo.user.bio == null
                  ? DictionaryManager
                        .instance.dictionaryTelegramScreen.bioText
                  : MyTelegramUserInfo.user.bio!,
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
