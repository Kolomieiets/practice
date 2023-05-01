import 'package:dio/dio.dart';
import 'package:practice_app/screens/api_requests_screen/components/dio_interceptor.dart';

class Api {
  late final Dio _dio;

  Api() {
    _dio = Dio();
    _dio.interceptors.add(DioInterceptor());
  }

  Future<Map<String, dynamic>> request() async {
    Response response;
    response = await _dio.get('https://catfact.ninja/fact');

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load fact(');
    }
  }
}
