class DictionaryCalculatorScreen{
  late final String _title;

  DictionaryCalculatorScreen({required Map<String, String> calculatorScreen}) {
    _title = calculatorScreen['title'] ?? '';
  }

  String get title => _title;
}