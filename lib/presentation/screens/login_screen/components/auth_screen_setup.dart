import 'package:flutter/material.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/presentation/screens/login_screen/components/login_screen.dart';
import 'package:practice_app/presentation/screens/login_screen/components/signup_screen.dart';

class AuthScreenSetup extends StatefulWidget {
  const AuthScreenSetup({super.key});

  @override
  State<AuthScreenSetup> createState() => _AuthScreenSetupState();
}

class _AuthScreenSetupState extends State<AuthScreenSetup> {
  bool showLoginPage = true;

  void toggle() {
    showLoginPage = !showLoginPage;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child:SafeArea(
        child: showLoginPage
          ? LoginScreen(
              showSignupScreen: toggle,
            )
          : SignupScreen(
              showLoginScreen: toggle,
            ),
      )
    );
    
  }
}
