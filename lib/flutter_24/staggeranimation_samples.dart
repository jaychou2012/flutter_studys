import 'package:flutter/material.dart';

class StaggerAnimationSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StaggerAnimationSamplesState();
  }
}

class StaggerAnimationSamplesState extends State<StaggerAnimationSamples>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> opacity;
  Animation<double> width;
  Animation<EdgeInsets> padding;
  Animation<BorderRadius> borderRadius;
  Animation<Color> color;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);

    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {
          // 动画值更新UI
        });
      });

    width = Tween<double>(
      begin: 50.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    )..addListener(() {
        setState(() {
          // 动画值更新UI
        });
      });

    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(4.0),
      end: BorderRadius.circular(75.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.375,
          0.500,
          curve: Curves.ease,
        ),
      ),
    )..addListener(() {
        setState(() {
          // 动画值更新UI
        });
      });

    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: 0.0),
      end: EdgeInsets.only(left: 80.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.ease,
        ),
      ),
    )..addListener(() {
        setState(() {
          // 动画值更新UI
        });
      });

    color = ColorTween(
      begin: Colors.blue,
      end: Colors.teal,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.8,
          curve: Curves.ease,
        ),
      ),
    )..addListener(() {
        setState(() {
          // 动画值更新UI
        });
      });
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StaggerAnimation'), primary: true),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("开始"),
            onPressed: () {
              _playAnimation();
            },
          ),
          Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: Container(
              padding: padding.value,
              alignment: Alignment.bottomCenter,
              child: Opacity(
                opacity: opacity.value,
                child: Container(
                  width: width.value,
                  height: width.value,
                  decoration: BoxDecoration(
                    color: color.value,
                    border: Border.all(
                      color: Colors.indigo[300],
                      width: 3.0,
                    ),
                    borderRadius: borderRadius.value,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
