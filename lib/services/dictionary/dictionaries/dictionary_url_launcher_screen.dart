class DictionaryUrlLauncherScreen{
  late final String _title;
  late final String _call;
  late final String _sms;
  late final String _email;
  late final String _urlInapp;
  late final String _urlInBrowser;

  DictionaryUrlLauncherScreen({required Map<String, String> urlLauncherScreen}) {
    _title = urlLauncherScreen['title'] ?? '';
    _call = urlLauncherScreen['call'] ?? '';
    _sms = urlLauncherScreen['sms'] ?? '';
    _email = urlLauncherScreen['email'] ?? '';
    _urlInapp = urlLauncherScreen['url_in_app'] ?? '';
    _urlInBrowser = urlLauncherScreen['url_in_browser'] ?? '';
  }
  String get title => _title;
  String get call => _call;
  String get sms => _sms;
  String get email => _email;
  String get urlInapp => _urlInapp;
  String get urlInBrowser => _urlInBrowser;
}