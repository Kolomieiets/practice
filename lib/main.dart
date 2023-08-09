import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_app/config/application.dart';
import 'package:practice_app/config/injection_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initDependencies();
  setupGetIt();

  await Hive.initFlutter();
  runApp(Application());
}
