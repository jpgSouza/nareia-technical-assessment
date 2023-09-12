import 'dart:async';

import 'package:dio/dio.dart';

import '../http_client_interface.dart';

class HttpClient implements IHttpClient {
  final Dio _dio;

  HttpClient(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: '',
      connectTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    );
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
