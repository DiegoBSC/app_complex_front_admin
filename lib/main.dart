import 'package:app_web_admin_complex/api/cafe_api.dart';
import 'package:app_web_admin_complex/providers/auth_provider.dart';
import 'package:app_web_admin_complex/providers/complex_provider.dart';
import 'package:app_web_admin_complex/providers/sidemenu_provider.dart';
import 'package:app_web_admin_complex/router/router.dart';
import 'package:app_web_admin_complex/services/local_storage.dart';
import 'package:app_web_admin_complex/services/navegation_service.dart';
import 'package:app_web_admin_complex/services/notification_service.dart';
import 'package:app_web_admin_complex/ui/layouts/auth/auth_layout.dart';
import 'package:app_web_admin_complex/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:app_web_admin_complex/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => SideMenuProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ComplexProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Administración del Canchas',
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavegationService.navigatorKey,
      scaffoldMessengerKey: NotificationService.messageKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking) {
          return const Center(
            child: SplashLayout(),
          );
        }

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white, //<-- SEE HERE
              ),
          scrollbarTheme: const ScrollbarThemeData().copyWith(
              thumbColor:
                  MaterialStateProperty.all(Colors.grey.withOpacity(0.5)))),
    );
  }
}
