import 'package:flutter/material.dart';
import 'package:practice_app/screens/monobank_ui/components/user_info.dart';

class AlphabetLetter extends StatelessWidget {
  final int ind;
  final List<UserInfo> users;
  AlphabetLetter(this.ind, this.users, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        child: Text(
          users[ind].title[0],
          style: TextStyle(color: Colors.grey),
        ));
  }
}