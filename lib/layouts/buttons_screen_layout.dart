import 'package:flutter/material.dart';

class ButtonsScreenLayout extends StatelessWidget {
  final List<Widget> children;
  const ButtonsScreenLayout({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children),
      ),
    );
  }
}
