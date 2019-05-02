/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:25 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:25 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpansionPanelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExpansionPanelPageState();
  }
}

class ExpansionPanelPageState extends State<ExpansionPanelPage> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              children: <ExpansionPanel>[
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Panel A',
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  },
                  body: Container(
                    padding: EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: Text('Content for Panel A\n The Content'),
                  ),
                  isExpanded: _isExpanded,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Panel B',
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  },
                  body: Container(
                    padding: EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: Text('Content for Panel B\n The Content'),
                  ),
                  isExpanded: _isExpanded,
                )
              ],
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  _isExpanded = !isExpanded;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}