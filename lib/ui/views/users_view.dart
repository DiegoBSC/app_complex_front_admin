import 'package:flutter/material.dart';

import 'package:app_web_admin_complex/datatables/users_datasourse.dart';
import 'package:app_web_admin_complex/providers/user_provider.dart';
import 'package:app_web_admin_complex/ui/cards/white_card.dart';
import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:app_web_admin_complex/ui/labels/custom_label.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UserProvider>(context);
    final usersDataSource = UsersDataSource(usersProvider.user);
    return ListView(physics: const ClampingScrollPhysics(), children: [
      Text(
        'Usuarios',
        style: CustomLabels.h1,
      ),
      const SizedBox(
        height: 20,
      ),
      WhiteCard(
        title: 'Lista de Usuarios',
        child: Theme(
          data: Theme.of(context).copyWith(
            cardColor: secondaryColor,
            dividerColor: Colors.white.withOpacity(0.5),
            primaryColor: Colors.white,
          ),
          child: PaginatedDataTable(
            columns: [
              const DataColumn(label: Text('Imagen')),
              DataColumn(
                  label: const Text('Nombre'),
                  onSort: (colIndex, _) {
                    // TODO: ordenar tabla.
                  }),
              DataColumn(
                  label: const Text('Teléfono'),
                  onSort: (colIndex, _) {
                    // TODO: ordenar tabla.
                  }),
              DataColumn(
                  label: const Text('Email'),
                  onSort: (colIndex, _) {
                    // TODO: ordenar tabla.
                    print(colIndex);
                  }),
              const DataColumn(label: Text('Roles')),
              const DataColumn(label: Text('Estado')),
              const DataColumn(label: Text('Acciones'))
            ],
            source: usersDataSource,
          ),
        ),
      )
    ]);
  }
}
