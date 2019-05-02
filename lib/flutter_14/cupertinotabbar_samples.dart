import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoTabBarSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CupertinoTabBarState();
  }
}

class CupertinoTabBarState extends State<CupertinoTabBarSamples> {
  // 默认选中第一项
  int _selectedIndex = 0;
  var _pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoTabBar Demo'),
      ),
      // body主体内容用PageView
      body: PageView(
        // 监听控制类
        controller: _pageController,
        onPageChanged: _onItemTapped,
        children: <Widget>[
          Text('Index 0: Home'),
          Text('Index 1: Business'),
          Text('Index 2: School'),
        ],
      ),
      // 底部导航栏用CupertinoTabBar
      bottomNavigationBar: CupertinoTabBar(
        // 导航集合
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        onTap: setPageViewItemSelect,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 底部点击切换
  void setPageViewItemSelect(int indexSelect) {
    _pageController.animateToPage(indexSelect,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
