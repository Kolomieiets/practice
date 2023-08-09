import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/monobank_ui/components/user_info.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';

class AlphabetLetter extends StatelessWidget {
  final int ind;
  final List<UserInfo> users;
  AlphabetLetter(this.ind, this.users, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSizes.h30,
        child: Text(
          users[ind].title[0],
          style: TextStyle(color: AppTextStyle.colorGrey),
        ));
  }
}