class DictionaryApiScreen {
  late final String _title;
  late final String _buttonCat;
  late final String _buttonDog;

  DictionaryApiScreen({required Map<String, String> apiScreen}) {
    _title = apiScreen['title'] ?? '';
    _buttonCat = apiScreen['button_cat'] ?? '';
    _buttonDog = apiScreen['button_dog'] ?? '';
  }

  String get title => _title;
  String get buttonCat => _buttonCat;
  String get buttonDog => _buttonDog;
}