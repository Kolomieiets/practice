import 'package:flutter/material.dart';

class AccountListItemContent extends StatelessWidget {
  final String title;
  final String subtitle;
  AccountListItemContent(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 15.0),
        ),
        SizedBox(height: 4.0),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13.0,
          ),
        ),
      ],
    );
  }
}