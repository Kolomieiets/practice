import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/dialogs/dialog_manager.dart';
import 'package:practice_app/presentation/dialogs/dialogs/reset_password_dialog.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/authentication/authentication.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = '/forgot_password';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? _error;
    return Scaffold(
      appBar: AppBar(
        title: Text(DictionaryManager
                        .instance.dictionaryAuthentication.resetPassword),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.h16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DictionaryManager
                        .instance.dictionaryAuthentication.resetPasswordTitle,
              style: TextStyle(
                  fontSize: AppSizes.h20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: AppSizes.h32),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                return EmailValidator.validate(_emailController.text)
                    ? null
                    : DictionaryManager
                        .instance.dictionaryErrors.invalidEmail;
              },
              decoration: InputDecoration(
                labelText: DictionaryManager
                        .instance.dictionaryAuthentication.email,
                suffixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(height: AppSizes.h16),
            SizedBox(
              width: AppSizes.w200,
              child: ElevatedButton(
                onPressed: () async {
                  _error = await Authentication.instance
                      .resetPassword(_emailController.text);
                  if (_error != null) {
                    FocusManager.instance.primaryFocus!.unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          _error!,
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    DialogManager.instance.show(
                      context: context,
                      child: ResetPasswordDialog(),
                    );
                    
                  }
                },
                child: Text(DictionaryManager
                        .instance.dictionaryAuthentication.resetPassword),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
