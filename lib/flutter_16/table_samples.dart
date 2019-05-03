import 'package:flutter/material.dart';

class TableSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TableSamplesState();
  }
}

class TableSamplesState extends State<TableSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Table Demo'), primary: true),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Table(
            // 有很多种设置宽度方式
            columnWidths: {
              ///固定列宽度
              0: FixedColumnWidth(50),

              ///弹性列宽度
              1: FlexColumnWidth(1),

              ///宽度占所在容器的百分比（0-1）
              2: FractionColumnWidth(0.5),
              3: IntrinsicColumnWidth(flex: 0.2),
              4: MaxColumnWidth(
                  FixedColumnWidth(100.0), FractionColumnWidth(0.1)),

              ///大于容器10%宽度，但小于等于100px
              5: MinColumnWidth(
                  FixedColumnWidth(100.0), FractionColumnWidth(0.1)),
            },
            // 设置表格边框
            border: TableBorder.all(color: Colors.black, width: 1),
            children: <TableRow>[
              // 每行内容设置
              TableRow(children: <Widget>[
                // 每个表格单元
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      'Title1',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      'Title2',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      'Title3',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
              TableRow(children: <Widget>[
                TableCell(
                  child: Text('data1'),
                ),
                TableCell(
                  child: Text('data2'),
                ),
                TableCell(
                  child: Text('data3'),
                ),
              ]),
              TableRow(children: <Widget>[
                TableCell(
                  child: Text('data1'),
                ),
                TableCell(
                  child: Text('data2'),
                ),
                TableCell(
                  child: Text('data3'),
                ),
              ]),
              TableRow(children: <Widget>[
                TableCell(
                  child: Text('data1'),
                ),
                TableCell(
                  child: Text('data2'),
                ),
                TableCell(
                  child: Text('data3'),
                ),
              ]),
              TableRow(children: <Widget>[
                TableCell(
                  child: Text('data1'),
                ),
                TableCell(
                  child: Text('data2'),
                ),
                TableCell(
                  child: Text('data3'),
                ),
              ]),
            ],
          ),
        ));
  }
}
