import 'package:flutter/material.dart';

class BottomAppBarSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomAppBarState();
  }
}

class BottomAppBarState extends State<BottomAppBarSamples> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomAppBar Demo'),
      ),
      // body主体内容
      body: Text("Index 0：Home"),
      // 底部导航栏用BottomAppBar
      bottomNavigationBar: BottomAppBar(
        // 切口的距离
        notchMargin: 6,
        // 底部留出空缺
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.business),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.school),
              onPressed: null,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: null),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
