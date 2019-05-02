import 'package:flutter/material.dart';

class TabBarSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabBarSamplesState();
  }
}

class TabBarSamplesState extends State<TabBarSamples>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    //initialIndex为初始选中第几个，length为数量
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Demo'),
        primary: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.directions_bus),
              text: "Tab1",
            ),
            Tab(
              icon: Icon(Icons.directions_railway),
              text: "Tab2",
            ),
            Tab(
              icon: Icon(Icons.directions_boat),
              text: "Tab3",
            ),
            Tab(
              icon: Icon(Icons.directions_car),
              text: "Tab4",
            ),
            Tab(
              icon: Icon(Icons.directions_walk),
              text: "Tab5",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Text("TabBarView data1"),
          ),
          Center(
            child: Text("TabBarView data2"),
          ),
          Center(
            child: Text("TabBarView data3"),
          ),
          Center(
            child: Text("TabBarView data4"),
          ),
          Center(
            child: Text("TabBarView data5"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
