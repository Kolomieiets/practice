class DictionaryHomeScreen{
  late final String _title;
  late final String _content;
  late final String _ratingTitle;
  late final String _buttonNotification;
  late final String _reminder;
  late final String _notification;

  DictionaryHomeScreen({required Map<String, String> homeScreen}) {
    _title = homeScreen['title'] ?? '';
    _content = homeScreen['content'] ?? '';
    _ratingTitle = homeScreen['rating_title'] ?? '';
    _buttonNotification = homeScreen['button_notification'] ?? '';
    _reminder = homeScreen['reminder'] ?? '';
    _notification = homeScreen['notification'] ?? '';
  }

  String get title => _title;
  String get content => _content;
  String get ratingTitle => _ratingTitle;
  String get buttonNotification => _buttonNotification;
  String get reminder => _reminder;
  String get notification => _notification;
}