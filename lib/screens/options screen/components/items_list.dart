import 'package:flutter/material.dart';

class ItemsList extends StatelessWidget {
  final Widget content;
  ItemsList(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 8.0,
        ),
        child: content);
  }
}