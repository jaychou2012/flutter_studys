import 'package:redux/redux.dart';

// 定义实体State对象，内含属性和构造方法
class AppState {
  int counter;
  AppState(this.counter);
}

// Actions，也就是方法，可以定义多个方法在里面
enum Actions { Increment, Decrement }

// reducer，用于匹配Action，操作AppState里的数据
AppState reducer(AppState state, action) {
  if (action == Actions.Increment) {
    return new AppState(state.counter + 1);
  } else if (action == Actions.Decrement) {
    return new AppState(state.counter - 1);
  }
  return state;
}

// Store需要一个reducer和initialState（初始化实体对象，并赋初值）
final store = Store(reducer, initialState: AppState(0));
