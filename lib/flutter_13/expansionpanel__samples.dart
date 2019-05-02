/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:22 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:22 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpansionPanelListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExpansionPanelListPageState();
  }
}

class ExpansionPanelListPageState extends State<ExpansionPanelListPage> {
  List<ExpansionPanelItem> _expansionPanelItems;
  @override
  void initState() {
    super.initState();
    getExpansionPanelList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionPanelList"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ExpansionPanelList(
              children: _expansionPanelItems.map((ExpansionPanelItem item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        item.headerText,
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  },
                  body: item.body,
                  isExpanded: item.isExpand,
                );
              }).toList(),
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  _expansionPanelItems[panelIndex].isExpand = !isExpanded;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  List<ExpansionPanelItem> getExpansionPanelList() {
    _expansionPanelItems = new List();
    for (int i = 0; i < 5; i++) {
      _expansionPanelItems.add(ExpansionPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          child: Text('Content for Panel $i \n The Content'),
        ),
        isExpand: false,
      ));
    }
    _expansionPanelItems.length = 5;
    return _expansionPanelItems;
  }
}

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpand;
  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpand,
  });
}