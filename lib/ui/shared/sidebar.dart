import 'package:app_web_admin_complex/providers/auth_provider.dart';
import 'package:app_web_admin_complex/providers/sidemenu_provider.dart';
import 'package:app_web_admin_complex/router/router.dart';
import 'package:app_web_admin_complex/services/navegation_service.dart';
import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:app_web_admin_complex/ui/shared/widget/logo.dart';
import 'package:app_web_admin_complex/ui/shared/widget/menu_item_custom.dart';
import 'package:app_web_admin_complex/ui/shared/widget/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  void navigateTo(String routeName) {
    NavegationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    return Container(
      width: 200,
      height: double.infinity,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(color: primaryColor.withOpacity(0.3), blurRadius: 3)
          ]),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          Divider(color: primaryColor.withOpacity(0.2)),
          const SizedBox(
            height: 30,
          ),
          const TextSeparator(text: 'Menú'),
          MenuItemCustom(
              text: 'Dashboard',
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
              icon: Icons.compass_calibration_outlined,
              onPressed: () => navigateTo(Flurorouter.dashboardRoute)),
          MenuItemCustom(
              text: 'Reservas',
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.bookingsRoute,
              icon: Icons.shop_2_outlined,
              onPressed: () => navigateTo(Flurorouter.bookingsRoute)),
          const SizedBox(
            height: 20,
          ),
          const TextSeparator(text: 'Configuraciones'),
          MenuItemCustom(
              text: 'Usuarios',
              icon: Icons.person_add_alt_1_outlined,
              isActive: sideMenuProvider.currentPage == Flurorouter.usersRoute,
              onPressed: () => navigateTo(Flurorouter.usersRoute)),
          MenuItemCustom(
              text: 'Complejo',
              icon: Icons.add_business_outlined,
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.complexesRoute,
              onPressed: () => navigateTo(Flurorouter.complexesRoute)),
          MenuItemCustom(
              text: 'Configuración',
              icon: Icons.settings,
              isActive: false,
              onPressed: () => print('Configuración')),
          const SizedBox(
            height: 50,
          ),
          const TextSeparator(text: 'Salir'),
          MenuItemCustom(
              text: 'Cerrar Sesión',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
    );
  }
}
