import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/config/auto_router.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  static String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(DictionaryManager.instance.dictionaryErrors.oops),
          );
        }

        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          replaceScreen(snapshot);
        }

        return ColoredBox(
          color: Colors.white,
          child: Center(
            child: Image.asset(
              'assets/images/splashscreen.png',
              width: AppSizes.h80,
              // height: 100,
            ),
          ),
        );
      },
    );
  }

  void replaceScreen(AsyncSnapshot<User?> snapshot) {
    if (snapshot.hasData) {
      AppRouter.instance.replace(HomeRoute());
    } else if (!snapshot.hasData) {
      AppRouter.instance.replace(AuthRoute());
    }
  }
}
