import 'package:hive_flutter/hive_flutter.dart';

class StorageData {
  static const String _key = 'user_info';

  static void putData(Map<String, dynamic> textFieldData) async {
    LazyBox<dynamic> userInfo = await Hive.openLazyBox(_key);
    await userInfo.put(
      _key,
      textFieldData,
    );
    await userInfo.close();
  }

  static Future<Map<String, dynamic>> getData() async {
    LazyBox<dynamic> userInfo = await Hive.openLazyBox(_key);
    var json = await userInfo.get(_key);
    Map<String, dynamic> data = Map<String, dynamic>.from(json);
    await userInfo.close();
    return data;
  }

}
