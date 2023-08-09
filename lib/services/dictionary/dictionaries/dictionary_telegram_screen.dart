class DictionaryTelegramScreen{
  late final String _account;
  late final String _changePhone;
  late final String _username;
  late final String _bio;
  late final String _bioText;
  late final String _help;
  late final String _askQuestion;
  late final String _faq;
  late final String _privacyPolicy;
  late final String _numberConfirmation;
  late final String _updateNumber;
  late final String _learn_more;
  late final String _premium;
  late final String _settings;
  late final String _notificationsSounds;
  late final String _privacySecurity;
  late final String _dataStorage;
  late final String _chatSettings;
  late final String _stickerEmoji;
  late final String _folders;
  late final String _devices;
  late final String _language;
  late final String _telegramFor;

  DictionaryTelegramScreen({required Map<String, String> telegramScreen}) {
    _account = telegramScreen['account'] ?? '';
    _changePhone = telegramScreen['change_phone'] ?? '';
    _username = telegramScreen['username'] ?? '';
    _bio = telegramScreen['bio'] ?? '';
    _bioText = telegramScreen['bio_text'] ?? '';
    _help = telegramScreen['help'] ?? '';
    _askQuestion = telegramScreen['ask_question'] ?? '';
    _faq = telegramScreen['faq'] ?? '';
    _privacyPolicy = telegramScreen['privacy_policy'] ?? '';
    _numberConfirmation = telegramScreen['number_confirmation'] ?? '';
    _updateNumber = telegramScreen['update_number'] ?? '';
    _learn_more = telegramScreen['learn_more'] ?? '';
    _premium = telegramScreen['premium'] ?? '';
    _settings = telegramScreen['settings'] ?? '';
    _notificationsSounds = telegramScreen['notifications_sounds'] ?? '';
    _privacySecurity = telegramScreen['privacy_security'] ?? '';
    _dataStorage = telegramScreen['data_storage'] ?? '';
    _chatSettings = telegramScreen['chat_settings'] ?? '';
    _stickerEmoji = telegramScreen['sticker_emoji'] ?? '';
    _folders = telegramScreen['folders'] ?? '';
    _devices = telegramScreen['devices'] ?? '';
    _language = telegramScreen['language'] ?? '';
    _telegramFor = telegramScreen['telegram_for'] ?? '';
    
    
  }

  String get account => _account;
  String get changePhone => _changePhone;
  String get username => _username;
  String get bio => _bio;
  String get bioText => _bioText;
  String get help => _help;
  String get askQuestion => _askQuestion;
  String get faq => _faq;
  String get privacyPolicy => _privacyPolicy;
  String get numberConfirmation => _numberConfirmation;
  String get updateNumber => _updateNumber;
  String get learn_more => _learn_more;
  String get premium => _premium;
  String get settings => _settings;
  String get notificationsSounds => _notificationsSounds;
  String get privacySecurity => _privacySecurity;
  String get dataStorage => _dataStorage;
  String get chatSettings => _chatSettings;
  String get stickerEmoji => _stickerEmoji;
  String get folders => _folders;
  String get devices => _devices;
  String get language => _language;
  String get telegramFor => _telegramFor;
}