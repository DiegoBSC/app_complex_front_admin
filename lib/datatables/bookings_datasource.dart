import 'package:flutter/material.dart';

class BookingsDataSource extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      const DataCell(Text('Cell 01')),
      const DataCell(Text('Cell 02')),
      const DataCell(Text('Cell 03')),
      const DataCell(Text('Cell 04')),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 1000;

  @override
  int get selectedRowCount => 0;
}
