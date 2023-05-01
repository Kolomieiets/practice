import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('response.data => ${response.data}');
    super.onResponse(response, handler);
  }
}
