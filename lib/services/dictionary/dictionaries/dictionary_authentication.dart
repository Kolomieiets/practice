class DictionaryAuthentication {
  late final String _signinTitle;
  late final String _signupTitle;
  late final String _resetPasswordTitle;
  late final String _resetPassword;
  late final String _email;
  late final String _password;
  late final String _forgotPassword;
  late final String _confirmPassword;
  late final String _signin;
  late final String _signup;
  late final String _or;
  late final String _switchToSignup;
  late final String _switchToSignin;

  DictionaryAuthentication({required Map<String, String> authentication}) {
    _signinTitle = authentication['signin_title'] ?? '';
    _signupTitle = authentication['signup_title'] ?? '';
    _resetPasswordTitle = authentication['reset_password_title'] ?? '';
    _resetPassword = authentication['reset_password'] ?? '';
    _email = authentication['email'] ?? '';
    _password = authentication['password'] ?? '';
    _forgotPassword = authentication['forgot_password'] ?? '';
    _confirmPassword = authentication['confirm_password'] ?? '';
    _signin = authentication['signin'] ?? '';
    _signup = authentication['signup'] ?? '';
    _or = authentication['or'] ?? '';
    _switchToSignup = authentication['switch_to_signup'] ?? '';
    _switchToSignin = authentication['switch_to_signin'] ?? '';
  }


  String get signinTitle => _signinTitle;
  String get signupTitle => _signupTitle;
  String get resetPasswordTitle => _resetPasswordTitle;
  String get resetPassword => _resetPassword;
  String get email => _email;
  String get password => _password;
  String get forgotPassword => _forgotPassword;
  String get confirmPassword => _confirmPassword;
  String get signin => _signin;
  String get signup => _signup;
  String get or => _or;
  String get switchToSignup => _switchToSignup;
  String get switchToSignin => _switchToSignin;
}
