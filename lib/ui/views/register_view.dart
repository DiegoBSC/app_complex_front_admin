import 'package:app_web_admin_complex/providers/auth_provider.dart';
import 'package:app_web_admin_complex/providers/register_form_provider.dart';
import 'package:app_web_admin_complex/router/router.dart';
import 'package:app_web_admin_complex/ui/buttons/custom_outlined_button.dart';
import 'package:app_web_admin_complex/ui/buttons/link_text.dart';
import 'package:app_web_admin_complex/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: true);
        return Container(
          margin: const EdgeInsets.only(top: 0),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 370),
            child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: registerFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su usuario';
                        }
                        if (value.length < 5) {
                          return 'El usuario deberia ser mayor a 5 caracteres';
                        }
                        return null; // campo valido
                      },
                      onChanged: ((value) =>
                          registerFormProvider.username = value),
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.authInputDecoration(
                          hint: 'Ingrese su Nombre',
                          label: 'Nombre',
                          icon: Icons.supervised_user_circle_sharp),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '')) {
                          return 'Email no es válido';
                        }
                        return null;
                      },
                      onChanged: ((value) =>
                          registerFormProvider.email = value),
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.authInputDecoration(
                          hint: 'Ingrese su Email',
                          label: 'Email',
                          icon: Icons.supervised_user_circle),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su número móvil';
                          }
                          if (value.length < 10) {
                            return 'El número móbil es incorrecto';
                          }
                          return null; // campo valido
                        },
                        onChanged: ((value) =>
                            registerFormProvider.telephone = value),
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.authInputDecoration(
                          hint: 'Ingrese su Teléfono',
                          label: 'Teléfono',
                          icon: Icons.mobile_friendly,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su ncontraseña';
                        }
                        if (value.length < 8) {
                          return 'La contraseña debe tener al menos 8 caracteres';
                        }
                        return null; // campo valido
                      },
                      onChanged: ((value) =>
                          registerFormProvider.password = value),
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.authInputDecoration(
                          hint: '*******************',
                          label: 'Contraseña',
                          icon: Icons.lock_outline_rounded),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Repita su ncontraseña';
                        }
                        if (registerFormProvider.password != value) {
                          return 'Las contraseñas no coinciden';
                        }
                        return null; // campo valido
                      },
                      onChanged: ((value) =>
                          registerFormProvider.repeatPassword = value),
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.authInputDecoration(
                          hint: '*******************',
                          label: 'Repetir Contraseña',
                          icon: Icons.lock_outline_rounded),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomOutlinedButton(
                        onPressed: () {
                          final validForm = registerFormProvider.validateForm();
                          if (!validForm) return;

                          final authProider =
                              Provider.of<AuthProvider>(context, listen: false);
                          authProider.register(
                              registerFormProvider.username,
                              registerFormProvider.email,
                              registerFormProvider.telephone,
                              registerFormProvider.password);
                        },
                        text: 'Crear Cuenta'),
                    const SizedBox(
                      height: 15,
                    ),
                    LinkText(
                      text: 'Ingresar',
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Flurorouter.loginRoute);
                      },
                    )
                  ],
                )),
          )),
        );
      }),
    );
  }
}
