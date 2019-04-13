import 'package:flutter/material.dart';

class PracticeOneLoginSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PracticeOneLoginSamplesState();
  }
}

class PracticeOneLoginSamplesState extends State<PracticeOneLoginSamples> {
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
      appBar: AppBar(
          title: Text('PracticeOne Login Samples'),
          backgroundColor: Colors.teal,
          primary: true),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.2)),
                ),
                child: TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 18),
                  cursorColor: Colors.grey,
                  onSaved: (String value) {
                    _name = value;
                  },
                  validator: (String value) {
                    return value.contains('@') ? null : '要使用邮箱格式';
                  },
                  decoration: InputDecoration(
                      hintText: '请输入邮箱帐号...',
                      labelText: '用户名',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.2)),
                ),
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Colors.grey,
                  maxLines: 1,
                  onSaved: (value) {
                    _password = value;
                  },
                  onFieldSubmitted: (value) {},
                  keyboardType: TextInputType.numberWithOptions(),
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      hintText: '请输入密码...',
                      labelText: '密码',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  padding: EdgeInsets.all(13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  color: Colors.teal[500],
                  child: Text(
                    "登录",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    showLogin(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showLogin(BuildContext context) async {
    final _formState = _formKey.currentState;
    if (_formState.validate()) {
      _formState.save();
      return showDialog<void>(
          context: context,
          // 点击周围空白区域对话框是否消失
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("提示"),
              content: new Text("用户名:'$_name' \n 密码：'$_password'"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text("取消")),
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: new Text("确定"))
              ],
            );
          });
    }
  }
}
