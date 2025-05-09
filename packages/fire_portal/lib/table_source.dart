import 'package:flutter/material.dart';

class TableSource extends DataTableSource {
  final DataRow Function(int index) rows;
  final int length;

  TableSource({required this.rows, required this.length});

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return rows(index);
  }
}
