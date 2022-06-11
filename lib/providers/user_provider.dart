import 'dart:convert';

import 'package:app_web_admin_complex/models/http/complex_response.dart';
import 'package:app_web_admin_complex/services/local_storage.dart';
import 'package:flutter/material.dart';

import 'package:app_web_admin_complex/api/complex_api.dart';
import 'package:app_web_admin_complex/models/http/users_response.dart';
import 'package:app_web_admin_complex/models/user_presenter_model.dart';

class UserProvider extends ChangeNotifier {
  List<UserPresenter> user = [];
  bool isLoading = true;
  String complexId = '';
  int page = 0;
  int size = 10;
  String field = '';
  String sort = '';

  UserProvider() {
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final complexSelected = ComplexResponse.fromMap(
        json.decode(LocalStorage.prefs.getString('complexSelected')!));
    final response = await ComplexApi.httpGet(
        '/v1/users/${complexSelected.id}?page=$page&size=$size&field=$field&sort=$sort');
    final usersResponse = UsersResponse.fromMap(response);
    user = usersResponse.data;
    isLoading = false;
    notifyListeners();
  }

  Future<UserPresenter?> getUserById(String userId) async {
    try {
      final response = await ComplexApi.httpGet('/v1/users/user/$userId');
      final userResponse = UserPresenter.fromMap(response);
      return userResponse;
    } catch (e) {
      return null;
    }
  }

  void refreshUser(UserPresenter newUSer) {
    user = user.map((value) {
      if (value.id == newUSer.id) {
        value = newUSer;
      }
      return value;
    }).toList();
    notifyListeners();
  }
}
