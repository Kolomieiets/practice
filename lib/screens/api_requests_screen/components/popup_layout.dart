import 'package:flutter/material.dart';

class PopUpLayout extends StatelessWidget {
  final Widget child;
  const PopUpLayout({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
