import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IconSamplesState();
  }
}

class IconSamplesState extends State<IconSamples>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    ///动画控制类，产生0-1之间小数
    _controller = AnimationController(
        lowerBound: 0,
        upperBound: 1,
        duration: const Duration(seconds: 3),
        vsync: this);
        _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Widget'),
        primary: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.directions_bike),
            // 按钮处于按下状态时按钮的主要颜色
            splashColor: Colors.teal,
            // 按钮处于按下状态时按钮的辅助颜色
            highlightColor: Colors.pink,
            // 不可点击时颜色
            disabledColor: Colors.grey,
            // PNG图标主体颜色
            color: Colors.orange,
            onPressed: () {},
          ),
          // 图片PNG格式，有透明度
          ImageIcon(
            AssetImage('assets/check-circle.png'),
            color: Colors.teal,
            size: 30,
          ),
          Icon(
            Icons.card_giftcard,
            size: 26,
          ),
          // 使用unicode
          Text(
            "\uE000",
            style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 24.0,
                color: Colors.green),
          ),
          Icon(IconData(0xe614,
              // 也可以使用自己自定义字体
              fontFamily: "MaterialIcons",
              matchTextDirection: true)),
          AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: _controller,
            semanticLabel: 'Show menu',
          )
        ],
      ),
    );
  }
}
