import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_app/config/injection_config.dart';

@singleton
class DialogManager {
  static DialogManager get instance => getIt<DialogManager>();

  void show({
    required BuildContext context,
    required Widget child,
    bool dismissible = true,
  }) {
    showDialog(
        barrierDismissible: dismissible,
        context: context,
        builder: (_) {
          return child;
        });
  }

  void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
