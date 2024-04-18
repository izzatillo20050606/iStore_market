import 'package:dio/dio.dart';
import 'package:phone_store/main.dart';

class BaseOptionss {
  static String tokenn = box.get('token') ?? '';
 static BaseOptions baseOptions = BaseOptions(
    baseUrl: 'http://16.171.145.111:8000',
    headers: {
      'Content-Type': 'application/json',
     'Authorization':'Bearer $tokenn'
    },
    connectTimeout: const Duration(seconds: 4),
    receiveTimeout: const Duration(seconds: 5),
    contentType: 'application/json',
    responseType: ResponseType.json,
  );
}
