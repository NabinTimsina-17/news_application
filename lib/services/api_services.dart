import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpService {
  late Dio _dio;

  final baseUrl =
      'https://newsapi.org/v2/everything?q=tesla&from=2024-09-04&sortBy=publishedAt&apiKey=e332b11c23d64f4d93d86aff90eb1442'; // Your API key is included here

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }

  Future<Response> getRequest(String endpoint) async {
    try {
      Response res = await _dio.get(endpoint);
      return res;
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  void initializeInterceptors() {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ));
  }
}
