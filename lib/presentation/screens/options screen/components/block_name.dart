import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';

class BlockName extends StatelessWidget {
  final String name;
  BlockName(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppSizes.w24, top: AppSizes.h16),
      child: Text(
        name,
        style: TextStyle(
          color: AppTextStyle.colorBlue,
          fontWeight: FontWeight.bold,
          fontSize: AppTextStyle.font15,
        ),
      ),
    );
  }
}
