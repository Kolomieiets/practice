import 'package:flutter/material.dart';

class SettingsListItemContent extends StatelessWidget {
  final String title;
  final IconData icon;
  SettingsListItemContent(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(width: 16.0),
        Text(title),
      ],
    );
  }
}
