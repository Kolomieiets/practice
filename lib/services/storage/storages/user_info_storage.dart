import 'dart:convert';

import 'package:practice_app/services/global/entity/name_data.dart';
import 'package:practice_app/services/storage/storage_service.dart';

class UserInfoStorage {
  final String _key = 'user_info';
  final StorageService _storageService = StorageService();

  void put(NameData nameData) async {
    _storageService.put(key: _key, value: jsonEncode(nameData));
  }

  Future<NameData?> get() async {
    var data = await _storageService.get(_key);
    return data == null ? null : NameData.fromJson(jsonDecode(data));
  }

  void delete() {
    _storageService.delete(_key);
  }
}
