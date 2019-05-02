import 'package:flutter/material.dart';

class FlowSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlowSamplesState();
  }
}

class FlowSamplesState extends State<FlowSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flow Demo'), primary: true),
        body: Flow(
          delegate: FlowWidgetDelegate(margin: EdgeInsets.all(10.0)),
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.orange,
            ),
            Container(
              width: 160.0,
              height: 80.0,
              color: Colors.teal,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.red,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.yellow,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.brown,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.purple,
            ),
          ],
        ));
  }
}

class FlowWidgetDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.all(10);
  // 构造方法，传入每个child的间隔
  FlowWidgetDelegate({this.margin});

  // 必须要重写的方法：child的绘制控制代码，可以调整尺寸位置
  @override
  void paintChildren(FlowPaintingContext context) {
    var screenWidth = context.size.width;
    double offsetX = margin.left; //记录横向绘制的x坐标
    double offsetY = margin.top; //记录纵向绘制的y坐标
    // 遍历子控件进行绘制
    for (int i = 0; i < context.childCount; i++) {
      // 如果当前x左边加上子控件宽度小于屏幕宽度则继续绘制,否则换行
      var width = context.getChildSize(i).width + offsetX + margin.right;
      if (width < screenWidth) {
        // 绘制子控件
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0.0));
        offsetX = width + margin.left;
      } else {
        offsetX = margin.left;
        offsetY += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子控件
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0.0));
        offsetX += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  // 必须要重写的方法：是否需要重绘
  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  // 可选重写方法：是否需要重新布局
  @override
  bool shouldRelayout(FlowDelegate oldDelegate) {
    return super.shouldRelayout(oldDelegate);
  }

  // 可选重写方法：设置Flow布局的尺寸
  @override
  Size getSize(BoxConstraints constraints) {
    return super.getSize(constraints);
  }

  // 可选重写方法：设置每个child的布局约束条件，会覆盖已有的
  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return super.getConstraintsForChild(i, constraints);
  }
}
