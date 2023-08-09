import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';

class SettingsListItemContent extends StatelessWidget {
  final String title;
  final IconData icon;
  SettingsListItemContent(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(width: AppSizes.w16),
        Text(title),
      ],
    );
  }
}
