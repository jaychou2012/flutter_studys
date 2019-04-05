import 'package:flutter/material.dart';

//main.dart为应用入口dart类，里面void main()方法为入口函数
// 这里是lambda缩略写法，完整写法为下面这种：
// void main(){
//   return runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 这个Widget是应用的根布局，类似于页面容器
  //构建搭建页面
  @override
  Widget build(BuildContext context) {
    //入口页使用MaterialApp这个页面脚手架
    //可以快速构建页面
    //MaterialApp这个脚手架默认自带顶部ToolBar、路由、主题、国际化等等配置
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 在这里我们可以配置应用全局主题，后面主题课程部分会详细讲解
        //
        // 我们可以通过flutter run命令来运行程序，会看到蓝色状态栏和标题栏
        // 通过 primarySwatch属性来配置状态栏和标题栏颜色
        primarySwatch: Colors.green,
      ),
      // 设置启动页面Widget
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// 继承StatefulWidget，有状态管理
class MyHomePage extends StatefulWidget {
  // 这个是有参构造方法，用来传值的，这里我们不管
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  //重写创建状态
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

  // 自定义创建状态管理，继承自State<T>
class _MyHomePageState extends State<MyHomePage> {
  //声明变量临时存储次数
  int _counter = 0;
  // 定义方法来累加次数
  void _incrementCounter() {
    setState(() {
      //setState里用于刷新UI和绑定数据
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 这个方法每次调用 setState 都会调用
    //
    // Flutter框架已经帮我们优化了这部分，所以当我们需要刷新状态的时候不用担心性能问题
    // 这个用来构建页面具体布局，这里使用了Scaffold脚手架
    // 里面包含了AppBar、body、bottomNavigationBar、floatingActionButton等
    return Scaffold(
      appBar: AppBar(
        // 通过配置AppBar属性来控制显示效果，这里通过title来设置标题内容
        title: Text(widget.title),
      ),
      body: Center(
        // body部分用Center Widget布局来加载Widget布局内容，子控件居中排列
        child: Column(
          // Column是一个纵向列布局，子控件纵向排列
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //子控件，Text Widget用来显示文字内容
            Text(
              'You have pushed the button this many times:',
            ),
            // 动态绑定数据
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      // 浮动+号按钮
      floatingActionButton: FloatingActionButton(
        // 设置点击事件，执行_incrementCounter方法累加计数
        onPressed: _incrementCounter,
        // 设置长按提示的信息
        tooltip: 'Increment',
        // 设置图标
        child: Icon(Icons.add),
      ),
    );
  }
}
