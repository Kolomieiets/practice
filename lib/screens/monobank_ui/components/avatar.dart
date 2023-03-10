import 'package:flutter/material.dart';
import 'package:practice_app/screens/monobank_ui/components/user_info.dart';
import 'package:practice_app/screens/monobank_ui/components/users_list.dart';

class Avatar extends StatelessWidget {
  final int userInd;
  final int sortedInd;
  final List<UserInfo> users;

  Avatar(this.userInd, this.sortedInd, this.users, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(80)),
        color: users[sortedInd].color,
      ),
      child: UsersList.users[userInd].httpImage != null
          ? Image.network(
              UsersList.users[userInd].httpImage!,
              fit: BoxFit.cover,
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Text(
                _findFirstLetters(sortedInd),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
    );
  }


  String _findFirstLetters(int i) {
    String firstLetters = users[i].title;
    List<String> letters = firstLetters.split(' ');
    if (letters.length < 2) {
      firstLetters = '${letters[0][0]}';
    } else {
      firstLetters = '${letters[0][0]}${letters[1][0]}';
    }

    return firstLetters;
  }
}
