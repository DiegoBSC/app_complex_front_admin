import 'package:app_web_admin_complex/models/user_presenter_model.dart';
import 'package:app_web_admin_complex/providers/user_form_provider.dart';
import 'package:app_web_admin_complex/services/navegation_service.dart';
import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:flutter/material.dart';

class UsersDataSource extends DataTableSource {
  final List<UserPresenter> users;

  UsersDataSource(this.users);

  @override
  DataRow getRow(int index) {
    final UserPresenter user = users[index];

    final image = (user.image == null)
        ? const Image(
            image: AssetImage('assets/no-image.png'),
            width: 35,
            height: 35,
          )
        : FadeInImage.assetNetwork(
            placeholder: 'assets/loader2.gif',
            image: user.image!,
            width: 35,
            height: 35,
          );

    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(child: image)),
      DataCell(Text(user.username)),
      DataCell(Text(user.telephone)),
      DataCell(Text(user.email)),
      DataCell(Text(user.rolesPresenter.first.name)),
      DataCell(Text(user.status)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () =>
                  NavegationService.replaceTo('/dashboard/users/${user.id}'),
              icon: const Icon(
                Icons.edit_outlined,
                color: primaryColor,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.block_outlined,
                color: dangerColor,
              )),
        ],
      ))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
