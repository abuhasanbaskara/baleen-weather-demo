import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i("🌍 Network Request Url [${options.method}]: ${options.uri}");
    _logger.d("🌍 Network Request Parameters: ${options.queryParameters}");
    _logger.d("🌍 Network Request Data: ${options.data}");
    _logger.d("🌍 Network Request Headers: ${options.headers}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i("✅ Network Response Url [${response.requestOptions.method} ${response.statusCode}]: ${response.requestOptions.uri}");
    _logger.d("✅ Network Response: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e("❌ Network Error [${err.response?.statusCode}]: ${err.requestOptions.uri}");
    _logger.e("❌ Error Response: ${err.response?.data}");
    super.onError(err, handler);
  }
}
