import 'package:app_web_admin_complex/api/cafe_api.dart';
import 'package:app_web_admin_complex/models/http/auth_response.dart';
import 'package:app_web_admin_complex/router/router.dart';
import 'package:app_web_admin_complex/services/local_storage.dart';
import 'package:app_web_admin_complex/services/navegation_service.dart';
import 'package:app_web_admin_complex/services/notification_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  //String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  UserPresenter? user;

  AuthProvider() {
    isAuthenticated();
  }

  login(String termSearch, String password) {
    CafeApi.hhtpPost('/public/app/v1/user/login/ADMIN',
        {"username": termSearch, "password": password}).then((value) {
      final authResponse = AuthResponse.fromMap(value);
      user = authResponse.userPresenter;
      LocalStorage.prefs.setString('token', authResponse.token);
      authStatus = AuthStatus.authenticated;
      NavegationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((onError) {
      NotificationService.showSnackbarError('Error: Credenciales Inválidas');
    });
  }

  register(String username, String email, String telephone, String password) {
    final data = {
      'username': username,
      'email': email,
      'telephone': telephone,
      'password': password,
      'typeApp': 'ADMIN',
      'rolesPresenter': [
        {
          "name": "ROLE_ADMIN",
        }
      ],
      'status': 'ACT',
    };

    CafeApi.hhtpPost('/public/app/v1/user/save', data).then((value) {
      if (value == null) {
        return;
      }
      authStatus = AuthStatus.notAuthenticated;
      NavegationService.replaceTo(Flurorouter.loginRoute);
      NotificationService.showSnackbarSuccess('OK: Usuario Creado');
    }).catchError((onError) {
      NotificationService.showSnackbarError('Errorsssssss: $onError');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    if (token.isEmpty) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final response =
          await CafeApi.hhtpGet('/public/app/v1/user/validateToken/ADMIN');
      final authResponse = AuthResponse.fromMap(response);
      LocalStorage.prefs.setString('token', authResponse.token);

      user = authResponse.userPresenter;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      NotificationService.showSnackbarError('Error: Credenciales Inválidas');
      authStatus = AuthStatus.notAuthenticated;
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
