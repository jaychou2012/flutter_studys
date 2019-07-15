import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

// 继承自Model来实现自己的Model来存储数据
class CounterModel extends Model {
  // 定义属性
  int _counter = 0;

  // 获取值的方法
  int get counter => _counter;

  // 定义改变值的方法
  void increment() {
    _counter++;
    // 调用通知刷新数据
    notifyListeners();
  }

  static CounterModel of(BuildContext context) {
    return ScopedModel.of<CounterModel>(context);
  }
}
