import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';

class DialogLayout extends StatelessWidget {
  final Widget child;
  DialogLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h16,
      ),
      child: Center(
          child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(AppSizes.h16),
          child: child,
        ),
      )),
    );
  }
}
