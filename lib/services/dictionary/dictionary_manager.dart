import 'package:injectable/injectable.dart';
import 'package:practice_app/config/injection_config.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_api_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_authentication.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_calculator_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_change_info_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_chart_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_device_info_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_dialogs.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_drawer.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_errors.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_geolocation_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_global.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_home_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_monobank_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_sensors_plus_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_shimmer_loading_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_telegram_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_url_launcher_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_video_screen.dart';
import 'package:practice_app/services/dictionary/dictionaries/dictionary_work_with_images_screen.dart';

@singleton
class DictionaryManager {
  static DictionaryManager get instance => getIt<DictionaryManager>();

  late final String name;
  late final String code;

  late final DictionaryApiScreen dictionaryApiScreen;
  late final DictionaryAuthentication dictionaryAuthentication;
  late final DictionaryCalculatorScreen dictionaryCalculatorScreen;
  late final DictionaryChangeInfoScreen dictionaryChangeInfoScreen;
  late final DictionaryChartScreen dictionaryChartScreen;
  late final DictionaryDeviceInfoScreen dictionaryDeviceInfoScreen;
  late final DictionaryDialogs dictionaryDialogs;
  late final DictionaryErrors dictionaryErrors;
  late final DicitionaryGeolocationScreen dicitionaryGeolocationScreen;
  late final DictionaryGlobal dictionaryGlobal;
  late final DictionaryHomeScreen dictionaryHomeScreen;
  late final DictionaryMonobankScreen dictionaryMonobankScreen;
  late final DictionarySensorsPlusScreen dictionarySensorsPlusScreen;
  late final DictionaryShimmerLoadingScreen dictionaryShimmerLoadingScreen;
  late final DictionaryTelegramScreen dictionaryTelegramScreen;
  late final DictionaryUrlLauncherScreen dictionaryUrlLauncherScreen;
  late final DictionaryVideoScreen dictionaryVideoScreen;
  late final DictionaryWorkWithImagesScreen dictionaryWorkWithImagesScreen;
  late final DictionaryDrawer dictionaryDrawer;

  DictionaryManager(Map<String, dynamic> dictionary) {
    name = dictionary['name'];
    code = dictionary['code'];
    dictionaryApiScreen = DictionaryApiScreen(
      apiScreen: dictionary['api_screen'],
    );
    dictionaryAuthentication = DictionaryAuthentication(
      authentication: dictionary['authentication'],
    );
    dictionaryCalculatorScreen = DictionaryCalculatorScreen(
      calculatorScreen: dictionary['calculator_screen'],
    );
    dictionaryChangeInfoScreen = DictionaryChangeInfoScreen(
      changeInfoScreen: dictionary['change_info_screen'],
    );
    dictionaryChartScreen = DictionaryChartScreen(
      chartScreen: dictionary['chart_screen'],
    );
    dictionaryDeviceInfoScreen = DictionaryDeviceInfoScreen(
      deviceInfoScreen: dictionary['device_info_screen'],
    );
    dictionaryDialogs = DictionaryDialogs(
      dialogs: dictionary['dialogs'],
    );
    dictionaryErrors = DictionaryErrors(
      errors: dictionary['errors'],
    );
    dicitionaryGeolocationScreen = DicitionaryGeolocationScreen(
      geolocationScreen: dictionary['geolocation_screen'],
    );
    dictionaryGlobal = DictionaryGlobal(
      global: dictionary['global'],
    );
    dictionaryHomeScreen = DictionaryHomeScreen(
      homeScreen: dictionary['home_screen'],
    );
    dictionaryMonobankScreen = DictionaryMonobankScreen(
      monobankScreen: dictionary['monobank_screen'],
    );
    dictionarySensorsPlusScreen = DictionarySensorsPlusScreen(
      sensorsPlusScreen: dictionary['sensors_plus_screen'],
    );
    dictionaryShimmerLoadingScreen = DictionaryShimmerLoadingScreen(
      shimmerLoadingScreen: dictionary['shimmer_loading_screen'],
    );
    dictionaryTelegramScreen = DictionaryTelegramScreen(
      telegramScreen: dictionary['telegram_screen'],
    );
    dictionaryUrlLauncherScreen = DictionaryUrlLauncherScreen(
      urlLauncherScreen: dictionary['url_launcher_screen'],
    );
    dictionaryVideoScreen = DictionaryVideoScreen(
      videoScreen: dictionary['video_screen'],
    );
    dictionaryWorkWithImagesScreen = DictionaryWorkWithImagesScreen(
      workWithImagesScreen: dictionary['work_with_images_screen'],
    );
    dictionaryDrawer = DictionaryDrawer(
      drawer: dictionary['drawer'],
    );
  }
}
