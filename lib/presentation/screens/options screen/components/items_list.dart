import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';

class ItemsList extends StatelessWidget {
  final Widget content;
  ItemsList(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w24,
          vertical: AppSizes.h8,
        ),
        child: content);
  }
}