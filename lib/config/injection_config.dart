import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_app/config/injection_config.config.dart';
import 'package:practice_app/notifications_service/notofication_service.dart';
import 'package:practice_app/resources/i18n/en.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

final getIt = GetIt.I;

@injectableInit
void initDependencies() {
  getIt.init();
}

void setupGetIt() {
  NotificationService notification = NotificationService();
  notification.initNotifications();
  if(!GetIt.instance.isRegistered<DictionaryManager>()) {
  getIt.registerSingleton<DictionaryManager>(DictionaryManager());
  }
  getIt.registerSingleton<NotificationService>(notification);

}
