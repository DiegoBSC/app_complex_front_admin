import 'package:app_web_admin_complex/router/admin_handler.dart';
import 'package:app_web_admin_complex/router/no_page_found_handler.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  //Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

// DashBOard
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    //Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.native);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.native);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.native);

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
