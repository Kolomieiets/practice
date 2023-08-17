import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/monobank_ui/components/alphabet_letter.dart';
import 'package:practice_app/presentation/screens/monobank_ui/components/avatar.dart';
import 'package:practice_app/presentation/screens/monobank_ui/components/bank_card.dart';
import 'package:practice_app/presentation/screens/monobank_ui/components/user_info.dart';
import 'package:practice_app/services/global/entity/users_list.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';

class UserItemBuilder extends StatelessWidget {
  final String id;
  final int sortedListIndex;
  final List<UserInfo> users;
  final bool isFirst;
  UserItemBuilder(this.id, this.sortedListIndex, this.users, this.isFirst, {super.key});

  @override
  Widget build(BuildContext context) {
    int monobankUserIndex = _findUserIndexById(id);
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.h16,
          vertical: AppSizes.w12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isFirst) AlphabetLetter(sortedListIndex, users),
            Row(children: [
              Avatar(monobankUserIndex, sortedListIndex, users),
              SizedBox(width: AppSizes.w16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    users[sortedListIndex].title,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: AppTextStyle.font16,
                    ),
                  ),
                  SizedBox(height: AppSizes.h2),
                  BankCard(monobankUserIndex),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }

  int _findUserIndexById(String id) {
    int userI = 0;

    for (int i = 0; i < UsersList.users.length; ++i) {
      if (id == UsersList.users[i].id) {
        userI = i;
      }
    }
    return userI;
  }
}
