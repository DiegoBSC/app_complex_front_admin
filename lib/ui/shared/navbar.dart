import 'package:app_web_admin_complex/providers/sidemenu_provider.dart';
import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:app_web_admin_complex/ui/shared/widget/navbar_avatar.dart';
import 'package:app_web_admin_complex/ui/shared/widget/notification_indicator.dart';
import 'package:app_web_admin_complex/ui/shared/widget/search_text.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(color: primaryColor.withOpacity(0.5), blurRadius: 3)
          ]),
      child: Row(
        children: [
          if (size.width <= 700)
            IconButton(
                onPressed: () {
                  SideMenuProvider.openMenu();
                },
                icon: const Icon(
                  Icons.menu_outlined,
                  color: primaryColor,
                )),
          const SizedBox(width: 10),
          if (size.width > 390)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const SearchText(),
            ),
          const Spacer(),
          const NotificationIndicator(),
          const SizedBox(
            width: 10,
          ),
          const NavbarAvatar(),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
