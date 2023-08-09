import 'package:practice_app/services/storage/storage_service.dart';

class ImagePathStorage {
  final String _key = 'image_path';
  final StorageService _storageService = StorageService();

  void put(String path) async {
    _storageService.put(key: _key, value: path);
  }

  Future<String?> get() async {
    String? newPath = await _storageService.get(_key);
    return newPath;
  }

  void delete() {
    _storageService.delete(_key);
  }
}