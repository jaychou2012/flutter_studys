import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Utils {
  BuildContext context;

  // 可以设置构造方法，传递参数，参数传递时有区别，通过key:value形式
  Utils({@required this.context}) : assert(context != null);

  // 首先指定返回类型，然后定义方法名
  ///获取时间戳毫秒数,13位
  int getMilliseconds() {
    return DateTime.now().millisecondsSinceEpoch;
  }
  // 方法名后可以设置传递的参数
  ///复制到剪贴板
  void setClipData(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  // 以下划线开始的方法名这个类的外部不可以调用，只能内部进行调用使用
  ///获取屏幕宽度
  double _getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  ///获取屏幕高度
  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  ///获取屏幕状态栏高度
  double getStatusBarTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  ///获取屏幕方向
  Orientation getScreenOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  Future<String> getBatteryLevel() async {
    var batteryLevel = 'unknown';
    MethodChannel methodChannel = MethodChannel('samples.flutter.io/battery');
    try {
      int result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%';
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
    }
    return batteryLevel;
  }
}