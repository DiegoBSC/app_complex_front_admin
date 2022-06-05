import 'package:app_web_admin_complex/datatables/bookings_datasource.dart';
import 'package:app_web_admin_complex/ui/buttons/custom_icon_button.dart';
import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:app_web_admin_complex/ui/labels/custom_label.dart';
import 'package:flutter/material.dart';

class BookingsView extends StatefulWidget {
  const BookingsView({Key? key}) : super(key: key);

  @override
  State<BookingsView> createState() => _BookingsViewState();
}

class _BookingsViewState extends State<BookingsView> {
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return ListView(physics: const ClampingScrollPhysics(), children: [
      Text(
        'BookingsView',
        style: CustomLabels.h1,
      ),
      const SizedBox(
        height: 20,
      ),
      PaginatedDataTable(
        // ignore: prefer_const_literals_to_create_immutables
        columns: [
          const DataColumn(label: Text('Logo')),
          const DataColumn(label: Text('Nombre')),
          const DataColumn(label: Text('Dirección')),
          const DataColumn(label: Text('estatus'))
        ],
        source: BookingsDataSource(),
        header: const Text(
          'Listado de canchas registradas',
          maxLines: 2,
        ),
        onRowsPerPageChanged: (value) {
          setState(() {
            _rowPerPage = value ?? 10;
          });
        },
        rowsPerPage: _rowPerPage,
        actions: [
          CustomIconButton(
              onPressed: () {},
              text: 'Crear',
              color: primaryColor,
              icon: Icons.add_chart_outlined)
        ],
      )
    ]);
  }
}
