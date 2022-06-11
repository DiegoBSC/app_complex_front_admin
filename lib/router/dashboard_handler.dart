import 'package:app_web_admin_complex/providers/auth_provider.dart';
import 'package:app_web_admin_complex/providers/sidemenu_provider.dart';
import 'package:app_web_admin_complex/router/router.dart';
import 'package:app_web_admin_complex/ui/views/bookings_view.dart';
import 'package:app_web_admin_complex/ui/views/complexes_view.dart';
import 'package:app_web_admin_complex/ui/views/dashboard_view.dart';
import 'package:app_web_admin_complex/ui/views/login_view.dart';
import 'package:app_web_admin_complex/ui/views/user_view.dart';
import 'package:app_web_admin_complex/ui/views/users_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler main = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const DashboardView();
    } else {
      return const LoginView();
    }
  });

  static Handler bookings = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.bookingsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const BookingsView();
    } else {
      return const LoginView();
    }
  });

  static Handler complexes = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.complexesRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const ComplexesView();
    } else {
      return const LoginView();
    }
  });

  static Handler users = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.usersRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const UsersView();
    } else {
      return const LoginView();
    }
  });

  static Handler user = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.userRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      if (params['uuid']?.first != null && params['uuid']!.first.isNotEmpty) {
        return UserView(uuid: params['uuid']!.first);
      }
      return const UsersView();
    } else {
      return const LoginView();
    }
  });
}
