import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/config/auto_router.dart';
import 'package:practice_app/presentation/dialogs/dialog_manager.dart';
import 'package:practice_app/presentation/dialogs/dialogs/loading_dialog.dart';
import 'package:practice_app/presentation/screens/login_screen/components/auth_change_text.dart';
import 'package:practice_app/presentation/screens/login_screen/mixins/login_mixin.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showSignupScreen;
  const LoginScreen({required this.showSignupScreen});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginMixin {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    FirebaseAuthException? error;
    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w16,
                vertical: AppSizes.h16,
              ),
              child: Column(
                children: [
                  Container(
                    height: AppSizes.h240,
                    width: AppSizes.w300,
                    child: Image.asset('assets/images/login_cat.png'),
                  ),
                  SizedBox(height: AppSizes.h16),
                  Text(
                    DictionaryManager
                        .instance.dictionaryAuthentication.signinTitle,
                    style: TextStyle(
                      fontSize: AppSizes.h16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: AppSizes.h16),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return isValidEmail();
                    },
                    decoration: InputDecoration(
                      errorText: emailError,
                      labelText: DictionaryManager
                          .instance.dictionaryAuthentication.email,
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.h16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: hidePassword,
                    obscuringCharacter: '*',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return isValidPassword();
                    },
                    decoration: InputDecoration(
                      errorText: passwordError,
                      labelText: DictionaryManager
                          .instance.dictionaryAuthentication.password,
                      suffixIcon: passwordShowOrHideIcon(),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.h8),
                  Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        AppRouter.instance.push(ForgotPasswordRoute());
                      },
                      child: Text(
                        DictionaryManager
                            .instance.dictionaryAuthentication.forgotPassword,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.h16),
                  SizedBox(
                    width: AppSizes.w200,
                    child: ElevatedButton(
                      onPressed: () async {
                        DialogManager.instance.show(
                          dismissible: false,
                          context: context,
                          child: LoadingDialog(),
                        );
                        error = await signIn();
                        DialogManager.instance.close(context);
                        if (error != null) {
                          checkError(error!);
                        } else {
                          AppRouter.instance.replace(HomeRoute());
                        }
                      },
                      child: Text(
                        DictionaryManager
                            .instance.dictionaryAuthentication.signin,
                      ),
                    ),
                  ),
                  AuthChangeText(
                    onTapFunction: widget.showSignupScreen,
                    buttonText: DictionaryManager
                        .instance.dictionaryAuthentication.signup,
                    text: DictionaryManager
                        .instance.dictionaryAuthentication.switchToSignup,
                  ),
                ],
              ),
            ),
    );
  }
}
