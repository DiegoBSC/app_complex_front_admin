import 'package:app_web_admin_complex/models/http/complex_response.dart';
import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:flutter/material.dart';

class ComplexDataSource extends DataTableSource {
  final List<ComplexResponse> complexes;
  final BuildContext context;

  ComplexDataSource(this.complexes, this.context);

  @override
  DataRow getRow(int index) {
    final complex = complexes[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(complex.logo != null ? 'Foto' : 'Null')),
      DataCell(Text(complex.name)),
      DataCell(Text(
          '${complex.mainStreet} ${complex.numeration} ${complex.sideStreet}')),
      DataCell(Text(complex.status)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_outlined,
                color: primaryColor,
                size: 25,
              )),
          IconButton(
              onPressed: () {
                final dialog = AlertDialog(
                  backgroundColor: secondaryColor,
                  title: const Text('Esta seguro de borrarlo?'),
                  content: Text('Borrar definitivamente ${complex.name}?'),
                  actions: [
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'No',
                          style: TextStyle(
                              color:
                                  Colors.white.withOpacity(whiteTextOpacity)),
                        )),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Si, borrar',
                            style: TextStyle(
                                color: Colors.white
                                    .withOpacity(whiteTextOpacity)))),
                  ],
                );
                showDialog(context: context, builder: (_) => dialog);
              },
              icon: const Icon(
                Icons.delete_outline,
                color: dangerColor,
                size: 25,
              ))
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => complexes.length;

  @override
  int get selectedRowCount => 0;
}
