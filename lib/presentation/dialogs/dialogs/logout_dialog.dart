import 'package:flutter/material.dart';
import 'package:practice_app/config/auto_router.dart';
import 'package:practice_app/presentation/layouts/dialog_layout.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/authentication/authentication.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DictionaryManager.instance.dictionaryDialogs.logoutTitle,
            style: TextStyle(fontSize: AppSizes.h16),
          ),
          SizedBox(height: AppSizes.h10),
          Image.asset(
            'assets/images/logout_cat.png',
            height: AppSizes.h200,
            width: AppSizes.h200,
          ),
          SizedBox(height: AppSizes.h16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  Authentication.instance.signOut();
                  AppRouter.instance.replace(AuthRoute());
                },
                child: Text(
                  DictionaryManager.instance.dictionaryGlobal.yes,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(DictionaryManager.instance.dictionaryGlobal.no,),
              )
            ],
          ),
        ],
      ),
    );
  }
}
