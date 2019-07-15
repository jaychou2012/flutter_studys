import 'package:event_bus/event_bus.dart';

// 实例化EventBus，创建一个事件总线
EventBus eventBus = EventBus();

// 定义Event事件：即要传递和共享的实体类
class UserEvent {
  String name;
  
  UserEvent(this.name);
}

// 可以定义多个实体类
class BookEvent {
  String bookName;

  BookEvent(this.bookName);
}

