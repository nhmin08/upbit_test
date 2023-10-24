import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum HttpMethodType { get, post, put, delete }

class Api {
  String errorMessage = '';

  requestApi(HttpMethodType type, String baseUrl, String path,
      {String? contentType,
        String? accessToken,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? data,
        dynamic formJson}) async {
    try {
      Dio dio = Dio();

      dio.options.baseUrl = baseUrl;

      if (contentType != null) {
        dio.options.contentType = contentType;
      }

      if (accessToken != null) {
        dio.options.headers['authorization'] = 'Bearer $accessToken';
      }

      late Response response;

      switch (type) {
        case HttpMethodType.get:
          response = await dio.get(path, queryParameters: queryParameters, data: data);
          break;
        case HttpMethodType.post:
          response = await dio.post(path, data: data);
          break;
        case HttpMethodType.put:
          response = await dio.put(path, data: data);
          break;
        case HttpMethodType.delete:
          response = await dio.delete(path, data: data);
      }

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        debugPrint('dio success: ${response.data.toString()}');

        if (response.data == null || response.data == '') {
          return true;
        }

        if (formJson == null) {
          return response.data;
        }

        return formJson(response.data);
      }
    } catch (e) {
      if (e is DioException) {
        debugPrint('dio error: ${e.response.toString()}');
        if (e.response.toString().contains('message')) {
          //errorMessage = Error.fromJson(e.response!.data).message;
        }
      }
      return false;
    }
  }
}