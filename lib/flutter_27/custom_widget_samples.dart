import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'utils.dart';

class CustomWidgetSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomWidgetSamplesState();
  }
}

class CustomWidgetSamplesState extends State<CustomWidgetSamples> {
  @override
  void initState() {
    super.initState();
    Utils utils = Utils(context: context);
    utils.getScreenHeight(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CustomWidget'),
        ),
        //  ToolBar(
        //   onTap: () {
        //     print('click');
        //   },
        // ),
        // primary: true,
        body: Column(
          children: <Widget>[
            // Container(
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: LoadingDialog(text: '加载中...'),
            //   ),
            // ),
            CustomPaint(
              painter: Sky(),
              child: Center(
                child: Text(
                  '文字',
                ),
              ),
            )
          ],
        ));
  }
}

class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 绘制圆角矩形
    // 用Rect构建一个边长50,中心点坐标为150,150的矩形
    Rect rectCircle =
        Rect.fromCircle(center: Offset(150.0, 150.0), radius: 60.0);
    // 根据上面的矩形,构建一个圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rectCircle, Radius.circular(30.0));
    canvas.drawRRect(rrect, Paint()..color = Colors.yellow);
  }

  @override
  bool shouldRepaint(Sky oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}
