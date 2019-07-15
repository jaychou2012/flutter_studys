import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'event_bus.dart';

class EventBusDetailSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventBusDetailSamplesState();
  }
}

class EventBusDetailSamplesState extends State<EventBusDetailSamples> {
  var name = '初始数据';
  @override
  void initState() {
    super.initState();
    // 注册和监听t发送来的UserEven类型事件、数据，这里我们为了时时显示我们发送的内容，在这里也监听一下
    eventBus.on<UserEvent>().listen((UserEvent event) {
      setState(() {
        name = event.name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EventBus Detail Samples'), primary: true),
      body: Text(
        '$name',
        style: TextStyle(fontSize: 20),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 发送事件、数据
          eventBus.fire(UserEvent('Tom'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
