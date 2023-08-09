import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/login_screen/components/login_screen.dart';
import 'package:practice_app/services/authentication/authentication.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

mixin LoginMixin<T extends StatefulWidget> on State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  String? emailError;
  String? passwordError;

  bool hidePassword = true;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void checkError(FirebaseAuthException error) {
    if (error.code == 'user-not-found' || error.code == 'invalid-email') {
      emailError = DictionaryManager
                        .instance.dictionaryErrors.emailError;
      passwordError = null;
    } else if (error.code == 'wrong-password') {
      passwordError = DictionaryManager
                        .instance.dictionaryErrors.wrongPassword;
      emailError = null;
    } else {
      FocusManager.instance.primaryFocus!.unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.message!,
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String? isValidEmail() {
    return EmailValidator.validate(emailController.text)
        ? null
        : DictionaryManager
                        .instance.dictionaryErrors.invalidEmail;
  }

  String? isValidPassword() {
    return passwordController.text.length < 6
        ? DictionaryManager
                        .instance.dictionaryErrors.passwordLength
        : null;
  }

  Future<FirebaseAuthException?> signIn() async {
    return await Authentication.instance.signIn(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  IconButton passwordShowOrHideIcon() {
    return IconButton(
      icon: hidePassword
          ? Icon(Icons.remove_red_eye_outlined)
          : Icon(Icons.remove_red_eye),
      onPressed: () {
        hidePassword = !hidePassword;
        setState(() {});
      },
    );
  }
}
