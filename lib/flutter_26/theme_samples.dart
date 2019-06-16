import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThemeSamplesState();
  }
}

class ThemeSamplesState extends State<ThemeSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return theme1();
  }

// 创建全局主题
Widget theme1() {
  return MaterialApp(
    ///ThemeData.dark()
    ///ThemeData.light()
    ///默认有这两种主题
    ///也可以自定义主题，接近50种配置
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.lightBlue[800],
      accentColor: Colors.cyan[600],
      backgroundColor: Colors.white70,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: InkWell(
        child: Text(
          'data',
          style: TextStyle(fontSize: 18, decoration: TextDecoration.none),
        ),
        onTap: () {
          setState(() {});
        },
      ),
    ),
  );
}

// 局部主题覆盖全局主题
Widget theme2() {
  return Theme(
    data: ThemeData(
      primaryColor: Colors.yellow[800],
      accentColor: Colors.yellow[600],
      backgroundColor: Colors.white,
    ),
    child: Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: Text(
        'data',
        style: TextStyle(fontSize: 18, decoration: TextDecoration.none),
      ),
    ),
  );
}

// 扩展或修改全局主题
Widget theme3(BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(
      primaryColor: Colors.white30,
    ),
    child: Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: Text(
        'data',
        style: TextStyle(

            ///调用使用主题颜色
            color: Theme.of(context).primaryColor,
            fontSize: 18,
            decoration: TextDecoration.none),
      ),
    ),
  );
}

// 可以根据不同平台使用不同Theme
Widget color1() {
  return Scaffold(
    appBar: AppBar(
      title: Text('Color'),
    ),
    body: Container(
      child: Column(
        children: <Widget>[
          Text(
            'data',
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 18,
                decoration: TextDecoration.none),
          ),
          Text(
            'data',
            style: TextStyle(
                color: Colors.yellow.shade300,
                fontSize: 18,
                decoration: TextDecoration.none),
          ),
          Text(
            'data',
            style: TextStyle(
                color: Colors.yellow[100],
                fontSize: 18,
                decoration: TextDecoration.none),
          ),
          Text(
            'data',
            style: TextStyle(
                color: Color.fromARGB(255, 66, 165, 245),
                fontSize: 18,
                decoration: TextDecoration.none),
          ),
          Text(
            'data',
            style: TextStyle(
                color: Color.fromRGBO(66, 165, 245, 1.0),
                fontSize: 18,
                decoration: TextDecoration.none),
          ),
          Text(
            'data',
            style: TextStyle(
                color: Color(0xFF42A5F5),
                fontSize: 18,
                decoration: TextDecoration.none),
          ),
          Text(
            'data',
            style: TextStyle(

                ///混合色
                color: Color.alphaBlend(Colors.yellow, Colors.teal),
                fontSize: 18,
                decoration: TextDecoration.none),
          ),
          Text(
            'data',
            style: TextStyle(

                ///线性渐变色,t参数表示位置，范围（0-1）
                color: Color.lerp(Colors.yellow, Colors.pink, 0.6),
                fontSize: 18,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    ),
  );
}
}