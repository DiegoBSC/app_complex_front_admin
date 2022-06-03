import 'package:app_web_admin_complex/providers/auth_provider.dart';
import 'package:app_web_admin_complex/providers/sidemenu_provider.dart';
import 'package:app_web_admin_complex/router/router.dart';
import 'package:app_web_admin_complex/ui/views/bookings_view.dart';
import 'package:app_web_admin_complex/ui/views/dashboard_view.dart';
import 'package:app_web_admin_complex/ui/views/login_view.dart';
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
}
