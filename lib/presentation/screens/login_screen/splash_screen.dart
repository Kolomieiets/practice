import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/config/auto_router.dart';
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
          // return HomeScreen();
          print('YAY authoruzed => ${snapshot.data}');
          AppRouter.instance.replace(HomeRoute());
        } else if (snapshot.data == null) {
          // return AuthScreenSetup();
          print('YAY unauthoruzed => ${snapshot.data}');
          AppRouter.instance.replace(AuthRoute());
        }
        return ColoredBox(
          color: Colors.red,
        );
      },
    );
  }
}
