class DictionaryDeviceInfoScreen {
  late final String _title;
  late final String _device;
  late final String _connection;
  late final String _battery;
  late final String _yourDevice;
  late final String _systemVersion;
  late final String _mobileConnection;
  late final String _wifiConnection;
  late final String _noConnection;
  

  DictionaryDeviceInfoScreen({required Map<String, String> deviceInfoScreen}) {
    _title = deviceInfoScreen['title'] ?? '';
    _yourDevice = deviceInfoScreen['your_device'] ?? '';
    _connection = deviceInfoScreen['connection'] ?? '';
    _battery = deviceInfoScreen['battery'] ?? '';
    _device = deviceInfoScreen['device'] ?? '';
    _systemVersion = deviceInfoScreen['system_version'] ?? '';
    _mobileConnection = deviceInfoScreen['mobile_connection'] ?? '';
    _wifiConnection = deviceInfoScreen['wifi_connection'] ?? '';
    _noConnection = deviceInfoScreen['no_connection'] ?? '';

  }

  String get title => _title;
  String get device => _device;
  String get connection => _connection;
  String get battery => _battery;
  String get yourDevice => _yourDevice;
  String get systemVersion => _systemVersion;
  String get mobileConnection => _mobileConnection;
  String get wifiConnection => _wifiConnection;
  String get noConnection => _noConnection;
}
