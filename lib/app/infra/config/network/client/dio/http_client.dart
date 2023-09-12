import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../infra.dart';

class HttpClient implements IHttpClient {
  final Dio _dio;

  HttpClient(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: AppConstants.connectTimeout),
      receiveTimeout: const Duration(milliseconds: AppConstants.receiveTimeout),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    _dio.interceptors.add(PrettyDioLogger());
  }

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  @override
  Future<Response> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  }) {
    return _dio.post(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
      data: data,
    );
  }

  @override
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  }) {
    return _dio.delete(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
      data: data,
    );
  }

  @override
  Future<Response> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  }) {
    return _dio.put(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
      data: data,
    );
  }

  @override
  Future<Response> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  }) {
    return _dio.patch(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
      data: data,
    );
  }
}
