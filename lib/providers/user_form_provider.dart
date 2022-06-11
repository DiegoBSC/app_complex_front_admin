import 'package:app_web_admin_complex/api/complex_api.dart';
import 'package:app_web_admin_complex/models/http/response_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:app_web_admin_complex/models/user_presenter_model.dart';

class UserFormProvider extends ChangeNotifier {
  UserPresenter? user;
  bool isEmailOk = false;
  bool isTelephoneOk = false;
  bool isusernameOk = false;

  late GlobalKey<FormState> formKey;

  void updateListener() {
    notifyListeners();
  }

  bool validForm() {
    return formKey.currentState!.validate();
  }

  void validateDataUsername() {
    if (user!.username.isNotEmpty) {
      ComplexApi.httpGet(
              '/v1/users/existUsername/${user!.username}/ADMIN/${user!.id}')
          .then((value) => isusernameOk = value);
    }
  }

  void validateDataEmail() async {
    if (user!.email.isNotEmpty) {
      await ComplexApi.httpGet(
              '/v1/users/existEmail/${user!.email}/ADMIN/${user!.id}')
          .then((value) => isEmailOk = value);
    }
  }

  void validateDataTelephone() async {
    if (user!.telephone.isNotEmpty) {
      await ComplexApi.httpGet(
              '/v1/users/existTelephone/${user!.telephone}/ADMIN/${user!.id}')
          .then((value) => isTelephoneOk = value);
    }
  }

  Future<bool> updateUser() async {
    if (!validForm()) return false;

    final data = {
      'id': user!.id,
      'username': user!.username,
      'email': user!.email,
      'telephone': user!.telephone,
    };

    try {
      await ComplexApi.httpPut('/v1/users/update', data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<ResponseModel> uploadImage(String path, PlatformFile file) async {
    try {
      final response = await ComplexApi.httpUploadFile(path, file);
      final responseModel = ResponseModel.fromMap(response);
      print(responseModel.fieldUpdate);
      user!.image = responseModel.fieldUpdate;
      notifyListeners();
      return responseModel;
    } catch (e) {
      throw 'Error en user provider';
    }
  }
}
