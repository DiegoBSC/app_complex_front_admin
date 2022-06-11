import 'package:app_web_admin_complex/models/http/response_model.dart';
import 'package:app_web_admin_complex/services/local_storage.dart';
import 'package:app_web_admin_complex/services/notification_service.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class ComplexApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    //Url Base
    //_dio.options.baseUrl = 'http://localhost:80';
    _dio.options.baseUrl = 'https://complex-admin-backend.herokuapp.com';

    //Configuracion de Headers
    _dio.options.headers = {
      'Authorization': LocalStorage.prefs.get('token') != null
          ? 'Bearer ${LocalStorage.prefs.get('token')}'
          : '',
      'token': LocalStorage.prefs.get('token') ?? ''
    };
  }

  // Metodo GET
  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path,
          options: Options(
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json));
      return resp.data;
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! < 500) {
        throw ('Error: No encontrado');
      }
      if (e.response!.statusCode! >= 500) {
        throw ('Error: 500 error en el servidor');
      }
    }
  }

  // Metodo POST
  static Future httpPost(String path, Map<String, dynamic> data) async {
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
            'Error: ${ResponseModel.fromJson(e.response.toString())}');
      }
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    try {
      final resp = await _dio.put(path,
          data: data,
          options: Options(
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json));
      return resp.data;
    } catch (e) {
      if (e is DioError) {
        NotificationService.showSnackbarError(
            'Error: ${ResponseModel.fromJson(e.response.toString())}');
      }
    }
  }

  static Future httpUploadFile(String path, PlatformFile file) async {
    var multipartFile =
        MultipartFile.fromBytes(file.bytes!, filename: file.name);

    FormData formData = FormData.fromMap({
      "file": multipartFile,
    });
    try {
      final resp = await _dio.post(path,
          data: formData, options: Options(responseType: ResponseType.json));

      return resp.data;
    } on DioError catch (e) {
      throw ('Error en el upload image $e');
    }
  }
}
