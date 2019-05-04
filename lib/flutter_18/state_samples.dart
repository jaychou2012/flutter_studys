import 'package:flutter/material.dart';

class StateSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateSamplesState();
  }
}

class StateSamplesState extends State<StateSamples>
    with WidgetsBindingObserver {
  //插入渲染树时调用，只调用一次
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  //构建Widget时调用
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LifeCycleState'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }

  //state依赖的对象发生变化时调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  //组件状态改变时候调用，可能会调用多次
  @override
  void didUpdateWidget(StateSamples oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  //当移除渲染树的时候调用
  @override
  void deactivate() {
    super.deactivate();
  }

  //组件即将销毁时调用
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  //APP生命周期监听
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //恢复可见
    } else if (state == AppLifecycleState.paused) {
      //处在并不活动状态，无法处理用户响应
      //例如来电，画中画，弹框
    } else if (state == AppLifecycleState.inactive) {
      //不可见，后台运行，无法处理用户响应
    } else if (state == AppLifecycleState.suspending) {
      //应用被立刻暂停挂起，ios上不会回调
    }
    super.didChangeAppLifecycleState(state);
  }

  //其他方法

  //热重载时调用
  @override
  void reassemble() {
    super.reassemble();
  }

  //路由弹出
  @override
  Future<bool> didPopRoute() {
    return super.didPopRoute();
  }

  //新的路由
  @override
  Future<bool> didPushRoute(String route) {
    return super.didPushRoute(route);
  }

  //系统窗口相关改变回调，例如旋转
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
  }

  //文字缩放大小变化
  @override
  void didChangeTextScaleFactor() {
    super.didChangeTextScaleFactor();
  }

  //本地化语言变化
  @override
  void didChangeLocales(List<Locale> locale) {
    super.didChangeLocales(locale);
  }

  //低内存回调
  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
  }

  //当前系统改变了一些访问性活动的回调
  @override
  void didChangeAccessibilityFeatures() {
    super.didChangeAccessibilityFeatures();
  }

  //平台色调主题变化时
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
  }
}
