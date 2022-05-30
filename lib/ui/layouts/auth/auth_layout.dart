import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:app_web_admin_complex/ui/layouts/auth/widgets/background_login.dart';
import 'package:app_web_admin_complex/ui/layouts/auth/widgets/custom_tittle.dart';
import 'package:app_web_admin_complex/ui/layouts/auth/widgets/link_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar(
        child: ListView(physics: const ClampingScrollPhysics(), children: [
          (size.width > 1000)
              ? _DesktopBody(child: child)
              : _MobileBody(child: child),
          const LinkBar()
        ]),
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const CustomTittle(),
          SizedBox(width: double.infinity, height: 420, child: child),
          const SizedBox(
            width: double.infinity,
            height: 400,
            child: BackgroundLogin(),
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;
  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: bgColor,
      child: Row(children: [
        const BackgroundLogin(),
        Container(
          width: 600,
          height: double.infinity,
          color: bgColor,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const CustomTittle(),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: child),
            ],
          ),
        )
      ]),
    );
  }
}
