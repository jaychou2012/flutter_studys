import 'package:flutter/material.dart';

class FormSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormSamplesState();
  }
}

class FormSamplesState extends State<FormSamples> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  FormState _formState;
  String _name;
  String _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Widget'), primary: true),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            ///TextFormField主要用于Form表单，TextField普通输入框
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: '请输入用户名',
                  labelText: '用户名',
                  prefixText: '用户名：'),
              onSaved: (String value) {
                _name = value;
              },
              validator: (String value) {
                return value.contains('@') ? '用户名里不要使用@符号' : null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: '密码',
                  icon: Icon(Icons.lock),
                  hintText: '请输入用户名',
                  prefixText: '密码：'),
              maxLines: 1,
              maxLength: 32,
              obscureText: true,
              keyboardType: TextInputType.numberWithOptions(),
              validator: (value) {},
              onSaved: (value) {
                _password = value;
              },
              onFieldSubmitted: (value) {},
            ),

            ///被Tooltip包裹的控件长按弹出tips
            Tooltip(
              message: '表单提交',
              child: RaisedButton(
                child: Text('登录'),
                onPressed: () {
                  onSubmit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSubmit() {
    final _formState = _formKey.currentState;
    if (_formState.validate()) {
      _formState.save();
      showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("提示"),
              content: Column(
                children: <Widget>[
                  Text(
                    'Name: $_name',
                    style: TextStyle(
                        fontSize: 18, decoration: TextDecoration.none),
                  ),
                  Text(
                    'Password: $_password',
                    style: TextStyle(
                        fontSize: 18, decoration: TextDecoration.none),
                  ),
                ],
              ),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text("取消")),
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: new Text("确定")),
              ],
            );
          });
    }
  }
}
