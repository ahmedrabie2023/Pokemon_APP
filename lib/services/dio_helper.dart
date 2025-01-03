import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static late Dio dio;

  //TODO :: BaseURL
  static init() {
    String baseUrl = '';

    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        responseType: ResponseType.plain,
        headers: {
          'Content-Type': 'application/json',
        },
        validateStatus: (status) {
          return (status! <= 505);
        },
      ),
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String? acceptLang,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
      'accept-Language': acceptLang ?? 'en',
    };
    return await dio.get(url, queryParameters: query);
  }
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
      }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
          };
    return await dio.delete(url, queryParameters: query);
  }
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? acceptLang,
    String? token,
  }) {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      "Content-Type": "application/json",
      'accept-Language': acceptLang ?? 'en',
    };
    if (kDebugMode) {
      print(data);
    }
    if (kDebugMode) {
      print(url);
    }
    return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };

    return dio.put(url, queryParameters: query, data: data);
  }
}