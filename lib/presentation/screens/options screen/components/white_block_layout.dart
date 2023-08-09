import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';

class WhiteBlockLayout extends StatelessWidget {
  final Widget child;
  WhiteBlockLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Color.fromARGB(95, 157, 157, 157), blurRadius: 3.0),
              ],
            ),
            child: child),
            SizedBox(height: AppSizes.h10,)
      ],
    );
  }
}