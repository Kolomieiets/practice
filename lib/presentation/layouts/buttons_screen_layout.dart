import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';

class ButtonsScreenLayout extends StatelessWidget {
  final List<Widget> children;
  const ButtonsScreenLayout({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppSizes.w200,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children),
      ),
    );
  }
}
