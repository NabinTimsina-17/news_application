import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpService{
  late Dio _dio;

  final baseUrl = 'https://newsapi.org/v2/everything?q=tesla&from=2023-12-10&sortBy=publishedAt&apiKey=1ae2573dd0224cfa960a79776d3a21a6';

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }

Future<Response> getRequest(String endpoint) async{

  Response res;

  res = await _dio.get(endpoint);

  return res;

}


 

  void initializeInterceptors() {
    _dio.interceptors.add(PrettyDioLogger( requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,));
  }
}
