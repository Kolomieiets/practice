import 'package:flutter/material.dart';
import 'package:practice_app/config/auto_router.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class ResetPasswordDialog extends StatelessWidget {
  const ResetPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: AppSizes.h150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: AppSizes.h16,
            ),
            Text(
              DictionaryManager.instance.dictionaryDialogs.resetPassword,
            ),
            SizedBox(
              height: AppSizes.h16,
            ),
            ElevatedButton(
              onPressed: () {
                AppRouter.instance.replace(AuthRoute());
              },
              child: Text(
                DictionaryManager.instance.dictionaryDialogs.ok,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
