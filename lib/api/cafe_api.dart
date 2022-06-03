import 'dart:convert';

import 'package:app_web_admin_complex/models/http/exception_model.dart';
import 'package:app_web_admin_complex/services/local_storage.dart';
import 'package:app_web_admin_complex/services/notification_service.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    //Url Base
    //_dio.options.baseUrl = 'http://164.92.117.253:8080';
    _dio.options.baseUrl = 'http://localhost:8080';

    //Configuracion de Headers
    _dio.options.headers = {'token': LocalStorage.prefs.get('token') ?? ''};
  }

  // Metodo GET
  static Future hhtpGet(String path) async {
    try {
      final resp = await _dio.get(path,
          options: Options(
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json));
      return resp.data;
    } catch (e) {
      if (e is DioError) {
        NotificationService.showSnackbarError(
            'Error: ${ExceptionModel.fromJson(e.response.toString()).message}');
      }
    }
  }

  // Metodo POST
  static Future hhtpPost(String path, Map<String, dynamic> data) async {
    try {
      final resp = await _dio.post(path,
          data: data,
          options: Options(
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json));
      return resp.data;
    } catch (e) {
      if (e is DioError) {
        NotificationService.showSnackbarError(
            'Error: ${ExceptionModel.fromJson(e.response.toString()).message}');
      }
    }
  }
}
