import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'event_bus.dart';
import 'eventbus_detail_samples.dart';

class EventBusSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventBusSamplesState();
  }
}

class EventBusSamplesState extends State<EventBusSamples> {
  var name = '初始数据';
  @override
  void initState() {
    super.initState();
    // 注册和监听t发送来的UserEven类型事件、数据
    eventBus.on<UserEvent>().listen((UserEvent event) {
      setState(() {
        name = event.name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EventBus Samples'), primary: true),
      // 绑定数据
      body: Text(
        '$name',
        style: TextStyle(fontSize: 20),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EventBusDetailSamples();
          }));
        },
        tooltip: '跳转',
        child: Icon(Icons.add),
      ),
    );
  }
}
