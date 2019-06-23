import 'package:flutter/material.dart';

class ToolBar extends StatefulWidget implements PreferredSizeWidget {
  ToolBar({@required this.onTap}) : assert(onTap != null);

  final GestureTapCallback onTap;

  @override
  State createState() {
    return ToolBarState();
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(56.0);
  }
}

class ToolBarState extends State<ToolBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.white,
              size: 39,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                child: Text(
                  '搜索...',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            GestureDetector(
              onTap: this.widget.onTap,
              child: Icon(
                Icons.photo_camera,
                color: Colors.white,
                size: 39,
              ),
            )
          ],
        ),
      ),
    );
  }
}
