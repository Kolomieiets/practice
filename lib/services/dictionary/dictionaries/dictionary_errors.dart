class DictionaryErrors {
  late final String _oops;
  late final String _wrongPassword;
  late final String _emailError;
  late final String _invalidEmail;
  late final String _passwordLength;
  late final String _matchPassword;
  late final String _locationDisabled;
  late final String _locationPermission;
  late final String _locationPermissionDenied;
  late final String _confirmationFailed;

  DictionaryErrors({required Map<String, String> errors}) {
    _oops = errors['oops'] ?? '';
    _wrongPassword = errors['wrong_password'] ?? '';
    _emailError = errors['email_error'] ?? '';
    _invalidEmail = errors['invaid_email'] ?? '';
    _passwordLength = errors['password_length'] ?? '';
    _matchPassword = errors['match_password'] ?? '';
    _locationDisabled = errors['location_disabled'] ?? '';
    _locationPermission = errors['location_permission'] ?? '';
    _locationPermissionDenied = errors['location_permission_denied'] ?? '';
    _confirmationFailed = errors['confirmation_failed'] ?? '';
  }

  String get oops => _oops;
  String get wrongPassword => _wrongPassword;
  String get emailError => _emailError;
  String get invalidEmail => _invalidEmail;
  String get passwordLength => _passwordLength;
  String get matchPassword => _matchPassword;
  String get locationDisabled => _locationDisabled;
  String get locationPermission => _locationPermission;
  String get locationPermissionDenied => _locationPermissionDenied;
  String get confirmationFailed => _confirmationFailed;
}
