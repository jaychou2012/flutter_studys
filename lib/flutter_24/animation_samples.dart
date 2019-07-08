import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_samples/flutter_10/icon_samples.dart';

var icons = [
  AnimatedIcons.add_event,
  AnimatedIcons.arrow_menu,
  AnimatedIcons.close_menu,
  AnimatedIcons.ellipsis_search,
  AnimatedIcons.event_add,
  AnimatedIcons.home_menu,
  AnimatedIcons.list_view,
  AnimatedIcons.menu_arrow,
  AnimatedIcons.menu_close,
  AnimatedIcons.menu_home,
  AnimatedIcons.pause_play,
  AnimatedIcons.play_pause,
  AnimatedIcons.search_ellipsis,
  AnimatedIcons.view_list
];

class AnimationSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationSamplesState();
  }
}

///SingleTickerProviderStateMixin：单个Controller
///TickerProviderStateMixin：允许多个Controller
class AnimationSamplesState extends State<AnimationSamples>
    with TickerProviderStateMixin {
  double opacityLevel = 1.0;
  int count = 0;
  AnimationController _controller;
  Animation<double> _proxyAnimation;
  Animation<double> _curveAnimation;
  Animation<double> _tweenAnimation;
  Animation<double> _doubleAnimation;
  Animation<int> _opacityAnimation;
  Animation<Color> _colorAnimation;
  Animation<AlignmentGeometry> _alignmentAnimation;
  Animation<Decoration> _decorationAnimation;
  Animation<TextStyle> _textStyleAnimation;
  Animation<double> _fadeAnimation;
  Animation<RelativeRect> _positionedAnimation;
  Animation<Rect> _rectAnimation;
  Animation<double> _rotationAnimation;
  Animation<double> _scaleAnimation;
  Animation<double> _sizeAnimation;
  Animation<Offset> _slideAnimation;

  AnimationController _animationIconController;
  AnimationController _valueController;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  int selectIndex = 0;
  String selectItem = "A";
  List<String> lists = <String>['A', 'B', 'C'];

  ///Animatable：是可继续操作的类
  ///Animation：是生成一个动画的类
  @override
  void initState() {
    ///动画控制类，产生0-1之间小数
    _controller = AnimationController(
        lowerBound: 0,
        upperBound: 1,
        duration: const Duration(seconds: 3),
        vsync: this);
    _valueController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animationIconController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    ///动画效果类
    ///CurvedAnimation，AnimationMax
    ///曲线动画
    _curveAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );

    ///范围和插值
    _tweenAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _valueController,

        ///产生数据的速率曲线
        curve: Curves.easeIn,
      ),
    );
    _doubleAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: _valueController,

        ///产生数据的速率曲线
        curve: Curves.easeIn,
      ),
    )..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      })..addStatusListener((AnimationStatus status){
          // dismissed, forward, reverse, completed
      });

    _opacityAnimation = IntTween(begin: 0, end: 255).animate(
        CurvedAnimation(parent: _valueController, curve: Curves.bounceIn));
    _colorAnimation =
        ColorTween(begin: Colors.orange, end: Colors.teal).animate(_controller);
    _alignmentAnimation = AlignmentGeometryTween(
            begin: Alignment.topLeft, end: Alignment.topRight)
        .animate(_valueController);
    _decorationAnimation = DecorationTween(
        begin: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: DecorationImage(
            image: ExactAssetImage('assets/flutter-mark-square-64.png'),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.black,
            width: 8.0,
          ),
        ),
        end: BoxDecoration(
          color: Colors.orange,
          border: Border.all(
            color: Colors.teal,
            width: 2.0,
          ),
        )).animate(_valueController);
    _textStyleAnimation = TextStyleTween(
            begin: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Colors.orange),
            end: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.teal,
                decoration: TextDecoration.none))
        .animate(_valueController);
    _fadeAnimation = CurvedAnimation(
      parent: _valueController,
      curve: Curves.fastOutSlowIn,
    );
    _positionedAnimation = RelativeRectTween(
            begin: RelativeRect.fromLTRB(50, 10, 80, 100),
            end: RelativeRect.fromLTRB(0, 0, 0, 0))
        .animate(_valueController);
    _rectAnimation = RectTween(
            begin: Rect.fromLTRB(50, 10, 80, 100),
            end: Rect.fromLTRB(0, 0, 0, 0))
        .animate(_valueController);
    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(_valueController);
    _scaleAnimation = Tween(begin: 0.0, end: 2.0).animate(_valueController);
    _sizeAnimation = Tween(begin: 0.0, end: 100.0).animate(_valueController);
    _slideAnimation =
        Tween(begin: Offset(0, 20), end: Offset.zero).animate(_valueController);

    ///监听动画每一帧
    _curveAnimation.addListener(() {
      print('addListener');
    });
    ///动画状态监听器
    _curveAnimation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.forward) {
        print('Animation Start');
      } else if (status == AnimationStatus.completed) {
        print('Animation Completed');
        // _controller.reverse();
      } else if (status == AnimationStatus.reverse) {
        print('Animation Reverse');
      } else if (status == AnimationStatus.dismissed) {
        print('Animation Dismissed');
        _controller.forward();
      }
    });
    _valueController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: animation1(context),
    );
  }

  Widget animation1(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    print(_valueController.value);
    print(_doubleAnimation.value);
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              ///SizeTransition
              SizeTransition(
                sizeFactor: _sizeAnimation,
                child: Text('SizeTransition'),
              ),
              SizedBox(
                height: 30,
              ),

              ///SlideTransition
              SlideTransition(
                position: _slideAnimation,
                child: Container(
                  child: Text('SlideTransition'),
                  decoration: BoxDecoration(color: Colors.teal),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              ///动态使用Animation的value
              Container(
                width: _doubleAnimation.value,
                height: _doubleAnimation.value,
                color: Colors.teal,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: FlutterLogo(),
              ),

              SizedBox(
                height: 30,
              ),

              ///AnimatedWidget
              ScaleAnimatedWidget(
                animationController: _valueController,
                animation: _tweenAnimation,
              ),

              SizedBox(
                height: 30,
              ),

              ///AlignTransition
              AlignTransition(
                alignment: _alignmentAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orange,
                  child: Text('AlignTransition'),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              ///DecoratedBoxTransition
              DecoratedBoxTransition(
                child: Text('DecoratedBoxTransition'),
                decoration: _decorationAnimation,
                position: DecorationPosition.foreground,
              ),
              SizedBox(
                height: 30,
              ),

              ///DefaultTextStyleTransition
              DefaultTextStyleTransition(
                child: Text('DefaultTextStyleTransition'),
                style: _textStyleAnimation,
              ),
              SizedBox(
                height: 30,
              ),

              ///FadeTransition
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text('FadeTransition'),
              ),

              SizedBox(
                height: 30,
              ),

              ///PositionedTransition
              ///需为Stack子child
              Container(
                width: 200,
                height: 200,
                color: Colors.orange,
                child: Stack(
                  children: <Widget>[
                    PositionedTransition(
                      rect: _positionedAnimation,
                      child: Text('PositionedTransition'),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),

              ///RelativePositionedTransition
              ///需为Stack子child
              Container(
                width: 200,
                height: 200,
                color: Colors.orange,
                child: Stack(
                  children: <Widget>[
                    RelativePositionedTransition(
                      rect: _rectAnimation,
                      size: Size(100, 60),
                      child: Text('RelativePositionedTransition'),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),

              ///RotationTransition
              Center(
                child: RotationTransition(
                  turns: _rotationAnimation,
                  child: RaisedButton(
                    onPressed: () {
                      if (_controller.isAnimating) {
                        _controller.reset();
                      } else if (_controller.isCompleted) {
                        _controller.reset();
                      } else {
                        _controller.forward();
                      }
                    },
                    child: Text('RotationTransition'),
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),

              ///ScaleTransition
              ScaleTransition(
                scale: _scaleAnimation,
                child: Text('ScaleTransition'),
              ),

              SizedBox(
                height: 30,
              ),

              ///AnimatedList用法，给列表加动画
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            int length = lists.length;
                            print('insertItem:$length');
                            lists.add("value");
                            _listKey.currentState.insertItem(lists.length);
                          });
                        },
                        child: Text('Add'),
                      ),
                      FlatButton(
                        onPressed: () {
                          print(lists.length);
                          if (lists.length == 0) {
                            return;
                          }
                          setState(() {
                            lists.removeAt(selectIndex);
                            _listKey.currentState.removeItem(selectIndex,
                                (BuildContext context,
                                    Animation<double> animation) {
                              return ScaleTransition(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        print('click:$selectIndex');
                                        lists.removeAt(selectIndex);
                                      });
                                    },
                                    child: Padding(
                                      child: Text(
                                        'AnimatedList:$lists[$selectIndex]',
                                        style: textStyle,
                                      ),
                                      padding: EdgeInsets.all(10),
                                    ),
                                  ),
                                  scale: animation);
                            });
                          });
                        },
                        child: Text('Remove'),
                      ),
                    ],
                  ),
                  Container(
                    height: 300,
                    child: AnimatedList(
                      key: _listKey,
                      initialItemCount: 3,
                      itemBuilder: (BuildContext context, int index,
                          Animation<double> animation) {
                        return ScaleTransition(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  print('click:$index');
                                  if (selectIndex == index) {
                                    textStyle = textStyle.copyWith(
                                        color: Colors.teal[400]);
                                  }
                                  selectIndex = index;
                                });
                              },
                              child: Padding(
                                child: Text(
                                  'AnimatedList:$lists[$index]',
                                  style: textStyle,
                                ),
                                padding: EdgeInsets.all(10),
                              ),
                            ),
                            scale: animation);
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              ///AnimatedCrossFade
              AnimatedCrossFade(
                duration: const Duration(seconds: 3),
                firstChild: const FlutterLogo(
                    style: FlutterLogoStyle.horizontal, size: 100.0),
                secondChild: const FlutterLogo(
                    style: FlutterLogoStyle.stacked, size: 100.0),
                crossFadeState: CrossFadeState.showSecond,
                firstCurve:
                    const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                secondCurve:
                    const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                sizeCurve: Curves.fastOutSlowIn,
              ),

              ///AnimatedOpacity
              AnimatedOpacity(
                opacity: opacityLevel,
                child: RaisedButton(
                  onPressed: () {
                    print(opacityLevel);
                    setState(() {
                      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
                    });
                    print(opacityLevel);
                  },
                  child: Text('AnimatedOpacity'),
                ),
                duration: const Duration(seconds: 3),
              ),

              SizedBox(
                height: 30,
              ),

              ///AnimatedAlign
              AnimatedAlign(
                duration: const Duration(seconds: 3),
                alignment: Alignment.center,
                curve: Curves.fastOutSlowIn,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('AnimatedAlign'),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              ///AnimatedPhysicalModel
              AnimatedPhysicalModel(
                elevation: 2,
                shape: BoxShape.circle,
                shadowColor: Colors.teal,
                duration: const Duration(seconds: 3),
                color: Colors.orange,
                child: Text('AnimatedPhysicalModel'),
              ),
              SizedBox(
                height: 30,
              ),

              ///Transform
              Container(
                color: Colors.black,
                child: Transform(
                  alignment: Alignment.topRight,
                  transform: Matrix4.skewY(0.3)..rotateZ(-3.1415926 / 12.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: const Color(0xFFE8581C),
                    child: const Text('Apartment for rent!'),
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),

              ///AnimatedPadding
              AnimatedPadding(
                duration: const Duration(seconds: 3),
                padding: EdgeInsets.all(10),
                curve: Curves.fastOutSlowIn,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('AnimatedPadding'),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              ///AnimatedPositionedDirectional
              Stack(
                children: <Widget>[
                  AnimatedPositionedDirectional(
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('AnimatedPositionedDirectional'),
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                  FlutterLogo(),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              ///AnimatedPositioned,必须放置在Stack布局里
              Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    left: 20,
                    top: 30,
                    width: 100,
                    height: 50,
                    duration: const Duration(seconds: 3),
                    curve: Curves.fastOutSlowIn,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('AnimatedPositioned'),
                    ),
                  ),
                  FlutterLogo(),
                  Text('AnimatedPositioned')
                ],
              ),

              SizedBox(
                height: 30,
              ),

              ///AnimatedModalBarrier,模态需要放在容器里
              Container(
                width: 200,
                height: 130,
                child: AnimatedModalBarrier(
                  dismissible: true,
                  color: _colorAnimation,
                ),
              ),

              SizedBox(
                height: 30,
              ),

              ///AnimatedSwitcher,切换动画，要绑定Key值
              Column(
                children: <Widget>[
                  AnimatedSwitcher(
                    child: Text(
                      'AnimatedSwitcher:$count',
                      key: ValueKey<int>(count),
                    ),

                    ///设置切换动画
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(child: child, scale: animation);
                    },
                    duration: const Duration(seconds: 1),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        print('AnimatedSwitcher');
                        count += 1;
                      });
                    },
                    child: Text(
                      'AnimatedSwitcher',
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              ///AnimatedIcon,动画图标
              AnimatedIcon(
                icon: AnimatedIcons.menu_arrow,
                progress: _animationIconController,
                semanticLabel: 'Show menu',
              ),

              RaisedButton(
                onPressed: () {
                  _animationIconController.forward();
                },
                child: Text('AnimatedIcon'),
              ),

              SizedBox(
                height: 30,
              ),

              ///AnimatedContainer
              AnimatedContainer(
                padding: EdgeInsets.all(10),
                curve: Curves.bounceOut,
                duration: const Duration(seconds: 3),
                child: const FlutterLogo(
                  size: 30,
                ),
              ),

              ///Hero，页面跳转动画
              GestureDetector(
                child: Hero(
                  tag: 'hero',
                  transitionOnUserGestures: true,
                  child: IgnorePointer(
                    ignoring: false,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('Hero'),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return IconSamples();
                  }));
                },
              ),

              SizedBox(
                height: 30,
              ),

              ///AnimatedTheme
              AnimatedTheme(
                child: GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Text('AnimatedTheme'),
                ),
                data: ThemeData.dark(),
                duration: const Duration(seconds: 3),
              ),

              SizedBox(
                height: 30,
              ),

              ///AnimatedOpacity改变透明度
              LogoFade(),
              SizedBox(
                height: 30,
              ),

              ///AnimatedBuilder
              Center(
                child: AnimatedBuilder(
                  animation: BorderRadiusTween(
                          begin: BorderRadius.circular(10),
                          end: BorderRadius.circular(10))
                      .animate(_controller),
                  builder: (BuildContext context, Widget child) {
                    return child;
                  },
                  child: Container(
                    child: FlutterLogo(),
                    color: Colors.orange,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              ///AnimatedBuilder
              Spinner(),

              ///SingleChildRenderObjectWidget
              //  AnimatedSize(
              //     curve: Curves.linear,
              //     alignment: Alignment.center,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       child: Text('AnimatedAlign'),
              //     ),
              //     duration: const Duration(seconds: 3),
              //     vsync: this,
              //   ),

              ///StatelessWidget
              GrowTranstion(
                  _curveAnimation,
                  GestureDetector(
                    child: FlutterLogo(
                      size: 20,
                    ),
                    onTap: () {
                      _controller.forward();
                    },
                  )),
            ],
          ),
        )
      ],
    );
  }
}

class ScaleAnimatedWidget extends AnimatedWidget {
  final AnimationController animationController;
  ScaleAnimatedWidget(
      {Key key,
      Animation<double> animation,
      @required this.animationController})
      : super(key: key, listenable: animation);

  @override
  createState() {
    animationController.forward();
    return super.createState();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        decoration: BoxDecoration(color: Colors.redAccent),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value * 100,
        width: animation.value * 100,
      ),
    );
  }
}

class GrowTranstion extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTranstion(this.animation, this.child);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

///AnimatedOpacity改变透明度
class LogoFade extends StatefulWidget {
  @override
  createState() => LogoFadeState();
}

class LogoFadeState extends State<LogoFade> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(seconds: 3),
          child: FlutterLogo(),
        ),
        RaisedButton(
          child: Text('Fade Logo'),
          onPressed: _changeOpacity,
        ),
      ],
    );
  }
}

///AnimatedBuilder
class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(width: 200.0, height: 200.0, color: Colors.green),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * 3.1415926,
          child: child,
        );
      },
    );
  }
}

class ClickCounter extends StatefulWidget {
  const ClickCounter({Key key}) : super(key: key);

  @override
  _ClickCounterState createState() => _ClickCounterState();
}

class _ClickCounterState extends State<AnimationSamples> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: Text(
                '$_count',
                // This key causes the AnimatedSwitcher to interpret this as a "new"
                // child each time the count changes, so that it will begin its animation
                // when the count changes.
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
              child: const Text('Increment'),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}