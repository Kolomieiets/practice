import 'package:flutter/material.dart';
import 'package:practice_app/services/global/entity/users_list.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class BankCard extends StatelessWidget {
  final int ind;

  BankCard(this.ind);

  @override
  Widget build(BuildContext context) {
    return _isMonobank(ind)
        ? Container(
            alignment: Alignment.center,
            height: AppSizes.h16,
            width: AppSizes.w40,
            decoration: BoxDecoration(
              color: Color.fromRGBO(252, 84, 81, 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(AppSizes.w10),
              ),
            ),
            child: Text(
              DictionaryManager.instance.dictionaryMonobankScreen.mono,
              style: TextStyle(
                fontSize: AppTextStyle.font10,
                color: AppTextStyle.colorMono,
              ),
            ),
          )
        : Text(
            _encodeCard(ind),
            style: TextStyle(
                color: AppTextStyle.colorGrey, fontSize: AppTextStyle.font10),
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
