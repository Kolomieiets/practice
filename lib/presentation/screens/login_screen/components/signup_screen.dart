import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/config/auto_router.dart';
import 'package:practice_app/presentation/dialogs/dialog_manager.dart';
import 'package:practice_app/presentation/dialogs/dialogs/loading_dialog.dart';
import 'package:practice_app/presentation/screens/login_screen/components/auth_change_text.dart';
import 'package:practice_app/presentation/screens/login_screen/mixins/signup_mixin.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  static String routeName = '/sign_up';
  final VoidCallback showLoginScreen;
  const SignupScreen({required this.showLoginScreen});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with SignupMixin {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    String? error;
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
                    height: AppSizes.h300,
                    width: AppSizes.w300,
                    child: Image.asset('assets/images/signup_cat.png'),
                  ),
                  Text(
                    DictionaryManager
                        .instance.dictionaryAuthentication.signupTitle,
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
                      labelText: DictionaryManager
                          .instance.dictionaryAuthentication.password,
                      suffixIcon: IconButton(
                          icon: passwordShowOrHideIcon(),
                          onPressed: () {
                            hidePassword = !hidePassword;
                            setState(() {});
                          }),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.h16),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: hideConfirmation,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscuringCharacter: '*',
                    validator: (value) {
                      return confirmPasswordCheck();
                    },
                    decoration: InputDecoration(
                      labelText: DictionaryManager
                          .instance.dictionaryAuthentication.confirmPassword,
                      suffixIcon: confirmationShowOrHideIcon(),
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
                        DialogManager.instance.show(
                          dismissible: false,
                          context: context,
                          child: LoadingDialog(),
                        );
                        if (confirmPasswordCheck() == null) {
                          error = await signUp();
                        } else {
                          error = DictionaryManager
                              .instance.dictionaryErrors.confirmationFailed;
                        }
                        DialogManager.instance.close(context);
                        if (error != null) {
                          errorCheck(error!);
                        } else {
                          AppRouter.instance.replace(HomeRoute());
                        }
                      },
                      child: Text(
                        DictionaryManager
                            .instance.dictionaryAuthentication.signup,
                      ),
                    ),
                  ),
                  AuthChangeText(
                    onTapFunction: widget.showLoginScreen,
                    buttonText: DictionaryManager
                        .instance.dictionaryAuthentication.signin,
                    text: DictionaryManager
                        .instance.dictionaryAuthentication.switchToSignin,
                  ),
                ],
              ),
            ),
    );
  }
}
