import 'package:dio/dio.dart';
import 'package:practice_app/boundary/requests/facts/api.dart';

class FactRepository {
  late final Api api;

  FactRepository() {
    api = Api();
  }

  Future<Map<String, dynamic>> catFact() async {
    Response response = await api.catFactRequest();
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load fact(');
    }
  }

  Future<String> dogPhoto() async {
    Response response = await api.dogPhotoRequest();
    String dogUrl;

    dogUrl = response.data['message'];
    if (response.statusCode == 200) {
      return dogUrl;
    } else {
      throw Exception('Failed to load photo');
    }
  }
}
