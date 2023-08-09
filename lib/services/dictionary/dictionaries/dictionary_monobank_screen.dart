class DictionaryMonobankScreen{
  late final String _title;
  late final String _textField;
  late final String _mono;

  DictionaryMonobankScreen({required Map<String, String> monobankScreen}) {
    _title = monobankScreen['title'] ?? '';
    _textField = monobankScreen['text_field'] ?? '';
    _mono = monobankScreen['mono'] ?? '';
  }

  String get title => _title;
  String get textField => _textField;
  String get mono => _mono;
}