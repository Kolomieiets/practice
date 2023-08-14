import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/presentation/screens/login_screen/components/login_screen.dart';
import 'package:practice_app/presentation/screens/login_screen/components/signup_screen.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  static String routeName = '/auth';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
