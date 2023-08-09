class DictionaryVideoScreen{
  late final String _title;

  DictionaryVideoScreen({required Map<String, String> videoScreen}) {
    _title = videoScreen['title'] ?? '';
  }
  String get title => _title;
}