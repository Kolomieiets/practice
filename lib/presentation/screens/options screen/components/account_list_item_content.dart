import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';

class AccountListItemContent extends StatelessWidget {
  final String title;
  final String subtitle;
  AccountListItemContent(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: AppTextStyle.font15),
        ),
        SizedBox(height: AppSizes.h4),
        Text(
          subtitle,
          style: TextStyle(
            color: AppTextStyle.colorGrey,
            fontSize: AppTextStyle.font13,
          ),
        ),
      ],
    );
  }
}