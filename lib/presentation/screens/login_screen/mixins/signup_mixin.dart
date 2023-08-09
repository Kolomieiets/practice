import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/login_screen/components/signup_screen.dart';
import 'package:practice_app/services/authentication/authentication.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

mixin SignupMixin<T extends StatefulWidget> on State<SignupScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  bool hidePassword = true;
  bool hideConfirmation = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
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

  String? confirmPasswordCheck() {
    return passwordController.text.trim() ==
            confirmPasswordController.text.trim()
        ? null
        : DictionaryManager
                        .instance.dictionaryErrors.matchPassword;
  }

  void errorCheck(String error) {
    FocusManager.instance.primaryFocus!.unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          error,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<String?> signUp() async {
    return await Authentication.instance
        .signUp(email: emailController.text, password: passwordController.text);
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

  IconButton confirmationShowOrHideIcon() {
    return IconButton(
      icon: hideConfirmation
          ? Icon(Icons.remove_red_eye_outlined)
          : Icon(Icons.remove_red_eye),
      onPressed: () {
        hideConfirmation = !hideConfirmation;
        setState(() {});
      },
    );
  }
}
