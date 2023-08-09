class DictionaryChangeInfoScreen {
  late final String _title;
  late final String _buttonChangeImage;
  late final String _buttonDeleteImage;
  late final String _nameField;
  late final String _surnameField;
  late final String _buttonSave;
  late final String _buttonSignout;

  DictionaryChangeInfoScreen({required Map<String, String> changeInfoScreen}) {
    _title = changeInfoScreen['title'] ?? '';
    _buttonChangeImage = changeInfoScreen['button_change_image'] ?? '';
    _buttonDeleteImage = changeInfoScreen['button_delete_image'] ?? '';
    _nameField = changeInfoScreen['name_field'] ?? '';
    _surnameField = changeInfoScreen['surname_field'] ?? '';
    _buttonSave = changeInfoScreen['button_save'] ?? '';
    _buttonSignout = changeInfoScreen['button_signout'] ?? '';
  }

  String get title => _title;
  String get buttonChangeImage => _buttonChangeImage;
  String get buttonDeleteImage => _buttonDeleteImage;
  String get nameField => _nameField;
  String get surnameField => _surnameField;
  String get buttonSave => _buttonSave;
  String get buttonSignout => _buttonSignout;
}
