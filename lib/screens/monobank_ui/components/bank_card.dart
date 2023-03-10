import 'package:flutter/material.dart';
import 'package:practice_app/screens/monobank_ui/components/users_list.dart';

class BankCard extends StatelessWidget {
  final int ind;

  BankCard(this.ind);

  @override
  Widget build(BuildContext context) {
    return _isMonobank(ind)
        ? Container(
            alignment: Alignment.center,
            height: 15,
            width: 40,
            decoration: BoxDecoration(
                color: Color.fromRGBO(252, 84, 81, 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(9),
                )),
            child: Text(
              'mono',
              style: TextStyle(
                fontSize: 10,
                color: Color.fromRGBO(255, 212, 199, 1.0),
              ),
            ),
          )
        : Text(
            _encodeCard(ind),
            style: TextStyle(color: Colors.grey, fontSize: 10),
          );
  }

  bool _isMonobank(int i) {
    if (UsersList.users[i].cardNumber.startsWith('4149')) {
      return true;
    }
    return false;
  }

  String _encodeCard(int ind) {
    String encoded = '';
    String cardNumber = UsersList.users[ind].cardNumber;

    for (int i = 0; i < cardNumber.length; ++i) {
      if (i > 3 && i < 12) {
        encoded += '*';
      } else {
        encoded += cardNumber[i];
      }
    }
    return encoded;
  }
}
