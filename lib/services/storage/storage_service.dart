import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  void put({required String key, required dynamic value}) async {
    LazyBox<dynamic> info = await Hive.openLazyBox(key);
    await info.put(
      key,
      value,
    );
    await info.close();
  }

  Future<dynamic> get(String key) async {
    LazyBox<dynamic> info = await Hive.openLazyBox(key);
    dynamic data = await info.get(key);
    await info.close();
    return data;
  }

  void delete(String key) async {
    LazyBox<dynamic> info = await Hive.openLazyBox(key);
    await info.delete(key);
  }
}
