import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/home_screen/home_screen.dart';
import 'package:practice_app/presentation/screens/login_screen/components/auth_screen_setup.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  static String routeName = '/auth';
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return Center(
        //     child: CircularProgressIndicator(),
        //   );
        // } else
        if (snapshot.hasError) {
          return Center(
            child: Text(
              DictionaryManager.instance.dictionaryErrors.oops,
            ),
          );
        } else if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return AuthScreenSetup();
        }
      },
    );
  }
}
