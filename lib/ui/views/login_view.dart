import 'package:app_web_admin_complex/providers/auth_provider.dart';
import 'package:app_web_admin_complex/providers/login_form_provider.dart';
import 'package:app_web_admin_complex/router/router.dart';
import 'package:app_web_admin_complex/ui/buttons/custom_outlined_button.dart';
import 'package:app_web_admin_complex/ui/buttons/link_text.dart';
import 'package:app_web_admin_complex/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: true);
        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 370),
            child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: loginFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (_) =>
                          onFormSubmit(loginFormProvider, authProvider),
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '') &&
                            value!.contains('@')) {
                          return 'Email no es válido';
                        }
                        return null;
                      },
                      onChanged: ((value) =>
                          loginFormProvider.termUser = value),
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
                      onFieldSubmitted: (_) =>
                          onFormSubmit(loginFormProvider, authProvider),
                      onChanged: ((value) =>
                          loginFormProvider.password = value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su contraseña';
                        }
                        if (value.length < 5) {
                          return 'La contaseña deberia ser mayor a 4 caracteres';
                        }
                        return null; // campo valido
                      },
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
                    CustomOutlinedButton(
                        onPressed: () =>
                            onFormSubmit(loginFormProvider, authProvider),
                        text: 'Ingresar'),
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
      }),
    );
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid) {
      authProvider.login(
          loginFormProvider.termUser, loginFormProvider.password);
    }
  }
}
