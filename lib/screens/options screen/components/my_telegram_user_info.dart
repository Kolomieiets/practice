import 'package:practice_app/screens/options%20screen/components/telegram_user.dart';

class MyTelegramUserInfo {
  static final TelegramUser _user = TelegramUser(
    firstName: 'Mr.',
    lastName: 'Cat',
    phoneNumber: '+38 (063) 617 63 01',
    username: '@WildNoMad',
    url: 'https://upload.wikimedia.org/wikipedia/commons/d/d2/Cat_August_2010-2.jpg',
  );

static TelegramUser get user => _user;
}

