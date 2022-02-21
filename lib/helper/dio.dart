import 'package:dio/dio.dart';

Dio dio(){
  return new Dio(
    BaseOptions(
      baseUrl: 'https://jwt.hvlicious.com/api/',
      headers: {
        'accept' : 'application/json',
        'Content-Type' : 'application/json;',
      }
    )
  );
}