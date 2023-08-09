class DictionarySensorsPlusScreen {
  late final String _title;
  late final String _stop;
  late final String _start;
  late final String _accelerometer;
  late final String _user_accelerometer;
  late final String _gyroscope;
  late final String _magnetometer;

  DictionarySensorsPlusScreen({required Map<String, String> sensorsPlusScreen}) {
    _title = sensorsPlusScreen['title'] ?? '';
    _stop = sensorsPlusScreen['stop'] ?? '';
    _start = sensorsPlusScreen['start'] ?? '';
    _accelerometer = sensorsPlusScreen['accelerometer'] ?? '';
    _user_accelerometer = sensorsPlusScreen['user_accelerometer'] ?? '';
    _gyroscope = sensorsPlusScreen['gyroscope'] ?? '';
    _magnetometer = sensorsPlusScreen['magnetometer'] ?? '';
  }

  String get title => _title;
  String get stop => _stop;
  String get start => _start;
  String get accelerometer => _accelerometer;
  String get user_accelerometer => _user_accelerometer;
  String get gyroscope => _gyroscope;
  String get magnetometer => _magnetometer;
}