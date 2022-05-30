import 'package:app_web_admin_complex/ui/views/login_view.dart';
import 'package:app_web_admin_complex/ui/views/register_view.dart';
import 'package:fluro/fluro.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    return const LoginView();
  });

  static Handler register = Handler(handlerFunc: (context, params) {
    return const RegisterView();
  });
}
