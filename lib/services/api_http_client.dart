import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokedex_mobile/constants.dart';

class ApiHttpClient {
  static final ApiHttpClient _httpClientSingleton = ApiHttpClient._internal();

  factory ApiHttpClient() {
    return _httpClientSingleton;
  }
  ApiHttpClient._internal();

  static BaseOptions _defaultDioOptions = BaseOptions(
    connectTimeout: 10000,
    receiveTimeout: 6000,
    followRedirects: true,
    baseUrl: kPokeAPIUrl,
  );
  Dio _dio = Dio(_defaultDioOptions);

  static final Options jsonOptions = Options(
    contentType: ContentType.json.toString(),
    responseType: ResponseType.json,
  );

  Future<Response<T>> getUri<T>(
    String path, {
    Options options,
    ProgressCallback onReceiveProgress,
  }) {
    return _dio.getUri<T>(
      Uri(path: path),
      options: options ?? jsonOptions,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
