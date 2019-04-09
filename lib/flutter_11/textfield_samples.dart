import 'package:flutter/material.dart';

class TextFieldSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextFieldSamplesState();
  }
}

class TextFieldSamplesState extends State<TextFieldSamples> {
  TextEditingController _controller;
  FocusNode focusNode1 = new FocusNode();
  FocusScopeNode focusScopeNode;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      print('input ${_controller.text}');
    });
    _controller.selection =
        TextSelection(baseOffset: 3, extentOffset: _controller.text.length);

    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });
    focusScopeNode = FocusScope.of(context);
    focusScopeNode.requestFocus(focusNode1);
    focusScopeNode.autofocus(focusNode1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField Widget'), primary: true),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: '用户名',
                    hintText: "输入用户名",
                    icon: Icon(Icons.email)),
              )),
          Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                textInputAction: TextInputAction.done,
                maxLines: 1,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: '密码',
                    hintText: "输入密码",
                    icon: Icon(Icons.lock)),
              )),
        ],
      ),
    );
  }
}
