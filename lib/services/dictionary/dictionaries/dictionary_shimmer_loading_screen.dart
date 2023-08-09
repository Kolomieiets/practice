class DictionaryShimmerLoadingScreen{
late final String _title;

  DictionaryShimmerLoadingScreen({required Map<String, String> shimmerLoadingScreen}) {
    _title = shimmerLoadingScreen['title'] ?? '';
  }
  String get title => _title;
}