class DicitionaryGeolocationScreen{
  late final String _title;
  late final String _buttonGetLocation;
  late final String _buttonShowMap;

  DicitionaryGeolocationScreen({required Map<String, String> geolocationScreen}) {
    _title = geolocationScreen['title'] ?? '';
    _buttonGetLocation = geolocationScreen['button_get_location'] ?? '';
    _buttonShowMap = geolocationScreen['button_show_map'] ?? '';
  }

  String get title => _title;
  String get buttonGetLocation => _buttonGetLocation;
  String get buttonShowMap => _buttonShowMap;
}