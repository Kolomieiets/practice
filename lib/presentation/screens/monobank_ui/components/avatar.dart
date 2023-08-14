import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/monobank_ui/components/user_info.dart';
import 'package:practice_app/services/global/entity/users_list.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';

class Avatar extends StatelessWidget {
  final int userInd;
  final int sortedInd;
  final List<UserInfo> users;

  Avatar(this.userInd, this.sortedInd, this.users, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.w45,
      width: AppSizes.w45,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.w60),
        ),
        color: users[sortedInd].color,
      ),
      child: UsersList.users[userInd].httpImage != null
          ? Image.network(
              UsersList.users[userInd].httpImage!,
              fit: BoxFit.cover,
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.w8, vertical: AppSizes.h10),
              child: Text(
                _findFirstLetters(sortedInd),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppTextStyle.font20,
                  color: AppTextStyle.colorWhite,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
    );
  }

  String _findFirstLetters(int i) {
    String firstLetters = users[i].title;
    List<String> letters = firstLetters.split(' ');
    if (letters.length < 2) {
      firstLetters = '${letters[0][0]}';
    } else {
      firstLetters = '${letters[0][0]}${letters[1][0]}';
    }

    return firstLetters;
  }
}
