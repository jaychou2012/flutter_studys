import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScaffoldSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScaffoldSamplesState();
  }
}

class ScaffoldSamplesState extends State<ScaffoldSamples> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return scaffoldWidget(context);
  }

  Widget scaffoldWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("标题栏"),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: Text("Body内容部分"),
      drawer: Drawer(
        child: DrawerHeader(
          child: Text("DrawerHeader"),
        ),
      ), //抽屉
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Cagergory')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Persion')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTap,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _onAdd();
        },
      ),
    );
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}
