import 'package:get_it/get_it.dart';
import 'package:practice_app/notifications_service/notofication_service.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  var notification = NotificationService();
  notification.initNotifications();
  getIt.registerSingleton<NotificationService>(notification);
}
