import 'package:app_web_admin_complex/datatables/bookings_datasource.dart';
import 'package:app_web_admin_complex/datatables/complex_datasource.dart';
import 'package:app_web_admin_complex/models/http/auth_response.dart';
import 'package:app_web_admin_complex/providers/auth_provider.dart';
import 'package:app_web_admin_complex/providers/complex_provider.dart';
import 'package:app_web_admin_complex/ui/buttons/custom_icon_button.dart';
import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:app_web_admin_complex/ui/labels/custom_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComplexesView extends StatefulWidget {
  const ComplexesView({Key? key}) : super(key: key);

  @override
  State<ComplexesView> createState() => _ComplexesViewState();
}

class _ComplexesViewState extends State<ComplexesView> {
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    AuthProvider user = Provider.of<AuthProvider>(context, listen: false);
    Provider.of<ComplexProvider>(context, listen: false)
        .getComplexes(user.user!);
  }

  @override
  Widget build(BuildContext context) {
    final complexes = Provider.of<ComplexProvider>(context).complexes;
    return ListView(physics: const ClampingScrollPhysics(), children: [
      Text(
        'Complejos Registrados',
        style: CustomLabels.h1,
      ),
      const SizedBox(
        height: 20,
      ),
      Theme(
        data: Theme.of(context).copyWith(
          cardColor: secondaryColor,
          dividerColor: Colors.white.withOpacity(0.5),
          primaryColor: Colors.white,
        ),
        child: PaginatedDataTable(
          // ignore: prefer_const_literals_to_create_immutables
          columns: [
            const DataColumn(label: Text('Logo')),
            const DataColumn(label: Text('Nombre')),
            const DataColumn(label: Text('Dirección')),
            const DataColumn(label: Text('Estado')),
            const DataColumn(label: Text('Acciones'))
          ],
          source: ComplexDataSource(complexes, context),
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
        ),
      )
    ]);
  }
}
