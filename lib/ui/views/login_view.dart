import 'package:app_web_admin_complex/router/router.dart';
import 'package:app_web_admin_complex/ui/buttons/custom_outlined_button.dart';
import 'package:app_web_admin_complex/ui/buttons/link_text.dart';
import 'package:app_web_admin_complex/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
          child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: CustomInputs.authInputDecoration(
                  hint: 'Ingrese su Email o Teléfono',
                  label: 'Email o Teléfono',
                  icon: Icons.supervised_user_circle),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: CustomInputs.authInputDecoration(
                  hint: '*******************',
                  label: 'Contraseña',
                  icon: Icons.lock_outline_rounded),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomOutlinedButton(onPressed: () {}, text: 'Ingresar'),
            const SizedBox(
              height: 20,
            ),
            LinkText(
              text: 'Registrate',
              onPressed: () {
                Navigator.pushNamed(context, Flurorouter.registerRoute);
              },
            )
          ],
        )),
      )),
    );
  }
}
