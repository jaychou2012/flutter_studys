import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GestureSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureSamplesState();
  }
}

class GestureSamplesState extends State<GestureSamples> {
  var gestureStatus = 'Gesture';
  var _top = 100.0;
  var _left = 100.0;

  var _width = 180.0;
  var _scale = 1.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getstureMove(context);
  }

  Widget getstureMove(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture'),
      ),
      body: Container(
          child: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: Icon(Icons.home),
              //手指按下时
              onPanDown: (DragDownDetails e) {
                //手指按下的位置
                print("按下位置：${e.globalPosition}");
              },
              //手指滑动时
              onPanUpdate: (DragUpdateDetails e) {
                //手指滑动时，更新偏移，重新构建
                setState(() {
                  _top += e.delta.dy;
                  _left += e.delta.dx;
                });
              },
              // 手指抬起时
              onPanEnd: (DragEndDetails e) {
                //滑动结束时在x轴、y轴上的速度
                print("结束时速度：${e.velocity}");
              },
            ),
          )
        ],
      )),
    );
  }

  Widget getstureScale(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture'),
      ),
      body: Container(
          child: Stack(
        children: <Widget>[
          Center(
            child: GestureDetector(
              //指定宽度，高度自适应
              child: Image.asset(
                "assets/image_appbar.jpg",
                width: _width,
              ),
              onScaleStart: (ScaleStartDetails details) {
                print('onScaleStart:$details.focalPoint');
              },
              onScaleEnd: (ScaleEndDetails details) {
                print('onScaleEnd:$details.focalPoint');
              },
              onScaleUpdate: (ScaleUpdateDetails details) {
                setState(() {
                  // 除了缩放也可以进行旋转操作
                  // details.rotation.clamp(0, 360);
                  // 缩放倍数在0.5到5倍之间
                  _scale = details.scale.clamp(0.5, 5);
                  _width = 180 * _scale;
                });
              },
            ),
          )
        ],
      )),
    );
  }

  Widget getstureVertical(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture'),
      ),
      body: Container(
          child: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: 100.0,
            child: GestureDetector(
                child: Icon(Icons.history),
                //垂直方向拖动监听
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _top += details.delta.dy;
                  });
                }),
          )
        ],
      )),
    );
  }

  Widget gesture(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('data'),
            Center(
              child: GestureDetector(
                child: RaisedButton(
                  child: Text(gestureStatus),
                ),
                onTap: () {
                  setState(() {
                    gestureStatus = 'onTap';
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    gestureStatus = 'onDoubleTap';
                  });
                },
                onLongPress: () {
                  setState(() {
                    gestureStatus = 'onLongPress';
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
