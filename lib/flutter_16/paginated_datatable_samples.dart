import 'package:flutter/material.dart';

class PaginatedDataTableSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaginatedDataTableState();
  }
}

class PaginatedDataTableState extends State<PaginatedDataTableSamples> {
  TableDataSource _dataSource = TableDataSource();
  int _defalutRowPageCount = 8;
  int _sortColumnIndex;
  bool _sortAscending = true;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('PaginatedDataTable Demo'), primary: true),
        // 外层用ListView包裹
        body: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            // PaginatedDataTable
            PaginatedDataTable(
              // 表格数据源
              source: _dataSource,
              // 默认为0
              initialFirstRowIndex: 0,
              // 全选操作
              onSelectAll: (bool checked) {
                _dataSource.selectAll(checked);
              },
              // 每页显示的行数
              rowsPerPage: _defalutRowPageCount,
              // 每页显示数量改变后的回调
              onRowsPerPageChanged: (value) {
                setState(() {
                  _defalutRowPageCount = value;
                });
              },
              // 设置每页可以显示的行数值列表选项
              availableRowsPerPage: [5, 8],
              // 翻页操作回调
              onPageChanged: (value) {
                print('$value');
              },
              // 是否升序排序
              sortAscending: _sortAscending,
              sortColumnIndex: _sortColumnIndex,
              // 表格头部
              header: Text('Data Header'),
              // 列
              columns: <DataColumn>[
                DataColumn(label: Text('名字')),
                DataColumn(
                    label: Text('价格'),
                    // 加入排序操作
                    onSort: (int columnIndex, bool ascending) {
                      _sort<num>((Shop p) => p.price, columnIndex, ascending);
                    }),
                DataColumn(label: Text('类型')),
              ],
            ),
          ],
        ));
  }

  //排序关联_sortColumnIndex,_sortAscending
  void _sort<T>(Comparable<T> getField(Shop s), int index, bool b) {
    _dataSource._sort(getField, b);
    setState(() {
      this._sortColumnIndex = index;
      this._sortAscending = b;
    });
  }
}

class Shop {
  final String name;
  final int price;
  final String type;

  // 默认为未选中
  bool selected = false;
  Shop(this.name, this.price, this.type);
}

class TableDataSource extends DataTableSource {
  final List<Shop> shops = <Shop>[
    Shop('name', 100, '家电'),
    Shop('name2', 130, '手机'),
    Shop('三星', 130, '手机'),
    Shop('三星', 130, '手机'),
    Shop('三星', 130, '手机'),
    Shop('海信', 100, '家电'),
    Shop('TCL', 100, '家电'),
  ];
  int _selectedCount = 0;

  ///根据位置获取内容行
  @override
  DataRow getRow(int index) {
    Shop shop = shops.elementAt(index);
    return DataRow.byIndex(
        cells: <DataCell>[
          DataCell(
            Text('${shop.name}'),
            placeholder: true,
          ),
          DataCell(Text('${shop.price}'), showEditIcon: true),
          DataCell(Text('${shop.type}'), showEditIcon: false),
        ],
        selected: shop.selected,
        index: index,
        onSelectChanged: (bool isSelected) {
          if (shop.selected != isSelected) {
            _selectedCount += isSelected ? 1 : -1;
            shop.selected = isSelected;
            notifyListeners();
          }
        });
  }

  @override

  ///行数是否不确定
  bool get isRowCountApproximate => false;

  @override

  ///行数
  int get rowCount => shops.length;

  @override

  ///选中的行数
  int get selectedRowCount => _selectedCount;

  void selectAll(bool checked) {
    for (Shop shop in shops) {
      shop.selected = checked;
    }
    _selectedCount = checked ? shops.length : 0;
    notifyListeners();
  }

  //排序,
  void _sort<T>(Comparable<T> getField(Shop shop), bool b) {
    shops.sort((Shop s1, Shop s2) {
      if (!b) {
        //两个项进行交换
        final Shop temp = s1;
        s1 = s2;
        s2 = temp;
      }
      final Comparable<T> s1Value = getField(s1);
      final Comparable<T> s2Value = getField(s2);
      return Comparable.compare(s1Value, s2Value);
    });
    notifyListeners();
  }
}

void onTap() {
  print('data onTap');
}
