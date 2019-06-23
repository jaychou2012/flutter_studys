/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:28:27 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:28:27 
 */
import 'package:flutter/material.dart';

// 继承我们的Dialog组件，这样它就具有Dialog的一些特性和方法属性
class LoadingDialog extends Dialog {
  String text;

  // 建立构造方法，传递参数
  LoadingDialog({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 120.0,
          height: 120.0,
          child: Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
