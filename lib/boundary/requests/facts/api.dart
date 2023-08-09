import 'package:dio/dio.dart';
import 'package:practice_app/presentation/screens/api_requests_screen/components/dio_interceptor.dart';
import 'package:practice_app/resources/app_urls.dart';

class Api {
  late final Dio _dio;

  Api() {
    _dio = Dio();
    _dio.interceptors.add(DioInterceptor());
  }

  Future<Response<dynamic>> catFactRequest() async {
    return await _dio.get(AppUrls.catFact);
  }

  Future<Response<dynamic>> dogPhotoRequest() async {
    
    return await _dio.get(AppUrls.dogPhoto);
    
    
  }
}
