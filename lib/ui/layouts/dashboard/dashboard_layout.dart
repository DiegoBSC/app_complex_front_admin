import 'package:app_web_admin_complex/providers/sidemenu_provider.dart';
import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:app_web_admin_complex/ui/shared/navbar.dart';
import 'package:app_web_admin_complex/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SideMenuProvider.menuController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            Row(
              children: [
                if (size.width >= 700) const SideBar(),
                Expanded(
                    child: Column(
                  children: [
                    const NavBar(),
                    Expanded(
                        child: Padding(
                      child: widget.child,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                    ))
                  ],
                ))
              ],
            ),
            if (size.width < 700)
              AnimatedBuilder(
                  animation: SideMenuProvider.menuController,
                  builder: (context, _) => Stack(
                        children: [
                          if (SideMenuProvider.isOpen)
                            AnimatedOpacity(
                              opacity: SideMenuProvider.opacity.value,
                              duration: const Duration(microseconds: 200),
                              child: GestureDetector(
                                onTap: () => SideMenuProvider.closeMenu(),
                                child: Container(
                                  width: size.width,
                                  height: size.height,
                                  color: bgColor.withOpacity(0.8),
                                ),
                              ),
                            ),
                          Transform.translate(
                            offset: Offset(SideMenuProvider.movement.value, 0),
                            child: const SideBar(),
                          )
                        ],
                      )),
          ],
        ));
  }
}
