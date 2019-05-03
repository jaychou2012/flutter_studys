import 'package:flutter/material.dart';

class DataTableSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DataTableState();
  }
}

class DataTableState extends State<DataTableSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('DataTable Demo'), primary: true),
        body: DataTable(
          ///行
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('data1'), onTap: onTap),
                DataCell(Text('data2'), onTap: onTap),
                DataCell(Text('data3'), onTap: onTap),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('data1'), onTap: onTap),
                DataCell(Text('data2'), onTap: onTap),
                DataCell(Text('data3'), onTap: onTap),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('data1'), onTap: onTap),
                DataCell(Text('data2'), onTap: onTap),
                DataCell(Text('data3'), onTap: onTap),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('data1'), onTap: onTap),
                DataCell(Text('data2'), onTap: onTap),
                DataCell(Text('data3'), onTap: onTap),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('data1'), onTap: onTap),
                DataCell(Text('data2'), onTap: onTap),
                DataCell(Text('data3'), onTap: onTap),
              ],
            ),
          ],

          ///列
          columns: <DataColumn>[
            DataColumn(label: Text('DataColumn1')),
            DataColumn(label: Text('DataColumn2')),
            DataColumn(label: Text('DataColumn3')),
          ],
        ));
  }
}

void onTap() {
  print('data onTap');
}
