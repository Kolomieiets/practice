import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';

class ExampleField extends StatelessWidget {
  final String example;
  const ExampleField(this.example, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w16, vertical: AppSizes.h16),
      alignment: Alignment.bottomRight,
      height: MediaQuery.of(context).size.height / 2.5,
      child: Text(
        example,
        style: TextStyle(fontSize: AppTextStyle.font40),
      ),
    );
  }
}
