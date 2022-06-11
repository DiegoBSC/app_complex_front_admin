// ignore_for_file: camel_case_types

import 'package:app_web_admin_complex/providers/user_form_provider.dart';
import 'package:app_web_admin_complex/services/navegation_service.dart';
import 'package:app_web_admin_complex/services/notification_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:app_web_admin_complex/models/user_presenter_model.dart';
import 'package:app_web_admin_complex/providers/user_provider.dart';
import 'package:app_web_admin_complex/ui/buttons/custom_outlined_button.dart';
import 'package:app_web_admin_complex/ui/cards/white_card.dart';
import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:app_web_admin_complex/ui/inputs/custom_inputs.dart';
import 'package:app_web_admin_complex/ui/labels/custom_label.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  final String uuid;
  const UserView({Key? key, required this.uuid}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  UserPresenter? user;
  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UserProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);

    usersProvider.getUserById(widget.uuid).then(((value) {
      if (value != null) {
        userFormProvider.user = value;
        userFormProvider.formKey = GlobalKey<FormState>();
        setState(() {
          user = value;
        });
      } else {
        user = null;
        Provider.of<UserFormProvider>(context, listen: false).user = null;
        NavegationService.replaceTo('dashboard/users');
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const ClampingScrollPhysics(), children: [
      Text(
        'Editar Usuario',
        style: CustomLabels.h1,
      ),
      const SizedBox(
        height: 20,
      ),
      if (user == null)
        const WhiteCard(
            child: SizedBox(
          height: 400,
          child: Center(
            child: Image(image: AssetImage('assets/loader2.gif')),
          ),
        )),
      if (user != null) _UserViewBody()
    ]);
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
        child: Table(
      columnWidths: const {0: FixedColumnWidth(250)},
      children: [
        TableRow(children: [_buildUserAvatar(), _buildUserForm()])
      ],
    ));
  }
}

class _buildUserForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    return WhiteCard(
        title: 'Información General',
        child: Form(
          key: userFormProvider.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(children: [
            Focus(
              onFocusChange: (hasFocus) {
                if (!hasFocus) {
                  userFormProvider.validateDataUsername();
                }
              },
              child: TextFormField(
                initialValue: user.username,
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Nombre del usuario',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_rounded),
                onChanged: (value) {
                  user.username = value;
                  userFormProvider.updateListener();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese usuario.';
                  }
                  if (value.length < 5) {
                    return 'El usuario deberia ser mayor a 5 caracteres.';
                  }
                  if (userFormProvider.isusernameOk) {
                    return 'El usuario ya esta registrado.';
                  }
                  return null; // campo valido
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Focus(
              onFocusChange: (hasFocus) {
                if (!hasFocus) {
                  userFormProvider.validateDataEmail();
                }
              },
              child: TextFormField(
                initialValue: user.email,
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Email del usuario',
                    label: 'Email',
                    icon: Icons.mark_email_read_outlined),
                onChanged: (value) {
                  user.email = value;
                  userFormProvider.updateListener();
                },
                validator: (value) {
                  if (!EmailValidator.validate(value ?? '') &&
                      value!.contains('@')) {
                    return 'Email no es válido.';
                  }
                  if (userFormProvider.isEmailOk) {
                    return 'El email ya esta registrado.';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Focus(
              onFocusChange: (hasFocus) {
                if (!hasFocus) {
                  userFormProvider.validateDataTelephone();
                }
              },
              child: TextFormField(
                initialValue: user.telephone,
                decoration: CustomInputs.formInputDecoration(
                  hint: 'Teléfono del usuario',
                  label: 'Teléfono',
                  icon: Icons.mobile_friendly_outlined,
                ),
                onChanged: (value) {
                  user.telephone = value;
                  userFormProvider.updateListener();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su número móvil.';
                  }
                  if (value.length < 10) {
                    return 'El número móbil es incorrecto.';
                  }
                  if (userFormProvider.isTelephoneOk) {
                    return 'El número móbil ya esta registrado.';
                  }
                  return null; // campo valido
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomOutlinedButton(
              onPressed: () async {
                final save = await userFormProvider.updateUser();
                if (save) {
                  NotificationService.showSnackbarSuccess(
                      'Usuario Actualizado');
                  Provider.of<UserProvider>(context, listen: false)
                      .refreshUser(user);
                } else {
                  NotificationService.showSnackbarError(
                      'Usuario no Actualizado');
                }
              },
              text: 'Guardar',
              isFilled: true,
              icon: Icons.save_alt_outlined,
              colorIcon: primaryColor,
            ),
          ]),
        ));
  }
}

class _buildUserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final image = (userFormProvider.user!.image == null)
        ? const Image(image: AssetImage('assets/no-image.png'))
        : FadeInImage.assetNetwork(
            placeholder: 'assets/loader2.gif',
            image: userFormProvider.user!.image!);
    return WhiteCard(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Perfil',
            style: CustomLabels.h2,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Stack(
              children: [
                ClipOval(child: Center(child: image)),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: FloatingActionButton(
                      backgroundColor: primaryColor,
                      elevation: 0,
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 20,
                      ),
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['jpg', 'png', 'jpeg']);

                        if (result != null) {
                          NotificationService.showBusyIndicator(context);
                          await userFormProvider.uploadImage(
                              '/v1/users/file/upload?typeFile=USER&id=${userFormProvider.user!.id}',
                              result.files.first);
                          Provider.of<UserProvider>(context, listen: false)
                              .refreshUser(userFormProvider.user!);
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
            width: 150,
            height: 160,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            userFormProvider.user!.username,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }
}
