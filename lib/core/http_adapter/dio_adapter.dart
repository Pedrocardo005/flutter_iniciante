import 'package:dio/dio.dart';

import 'http_client.dart';

class DioAdapter implements HttpClient {
  final Dio _dio;

  const DioAdapter({required Dio dio}) : _dio = dio;

  @override
  Future request(
    String url, {
    Map<String, dynamic>? data,
    String method = 'GET',
  }) async {
    Response response;
    switch (method) {
      case 'POST':
        response = await _dio.post(url, data: data);
        break;
      default:
        response = await _dio.get(url, queryParameters: data);
    }
    return response.data;
  }
}
