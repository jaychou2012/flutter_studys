import 'package:flutter/widgets.dart';

class FrogColor extends InheritedWidget {
  const FrogColor({
    Key key,
    @required this.color,
    @required Widget child,
  }) : assert(color != null),
       assert(child != null),
       super(key: key, child: child);

  final Color color;

  static FrogColor of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(FrogColor) as FrogColor;
  }

  @override
  bool updateShouldNotify(FrogColor old) => color != old.color;
}