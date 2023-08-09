class DictionaryGlobal {
  late final String _yes;
  late final String _no;

  DictionaryGlobal({required Map<String, String> global}) {
    _yes = global['yes'] ?? '';
    _no = global['no'] ?? '';
  }

  String get yes => _yes;
  String get no => _no;
}
