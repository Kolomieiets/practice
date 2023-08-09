import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_app/config/injection_config.dart';

@singleton
class Authentication {
  static Authentication get instance => getIt<Authentication>();

  Future<FirebaseAuthException?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (error) {
      return error;
    }
    return null;
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
    return null;
  }

  Future<String?> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
    return null;
  }
}
