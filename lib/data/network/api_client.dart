import 'package:baleen_weather_app_test/data/network/logging_interceptor.dart';
import 'package:baleen_weather_app_test/flavors.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio(BaseOptions(
    baseUrl: F.baseUrl,
    headers: {"content-type": "application/x-www-form-urlencoded"},
  )) {
    _dio.interceptors.add(LoggingInterceptor());
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data, {Options? options, Map<String, dynamic>? queryParameters}) {
    return _dio.post(
      endpoint,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
  }

  Future<Response> postMultipart(String endpoint, FormData data, {Options? options, Map<String, dynamic>? queryParameters}) {
    return _dio.post(
      endpoint,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
  }

  Future<Response<T>> get<T>(
      String path, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
        Map<String, String>? headers,
      }) {
    final mergedOptions = options?.copyWith(
      headers: {
        ...?options.headers,
        ...?headers,
      },
    ) ?? Options(
      headers: headers,
    );

    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: mergedOptions,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
