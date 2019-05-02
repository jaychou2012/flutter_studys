import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<String> items = <String>[
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
];

enum _MaterialListType {
  /// A list tile that contains a single line of text.
  oneLine,

  /// A list tile that contains a [CircleAvatar] followed by a single line of text.
  oneLineWithAvatar,

  /// A list tile that contains two lines of text.
  twoLine,

  /// A list tile that contains three lines of text.
  threeLine,
}

class ListViewSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewSamplesState();
  }
}

class ListViewSamplesState extends State<ListViewSamples> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: listView3(),
    );
  }

  ///最简单的ListView
  Widget listView1() {
    return ListView(
      children: <Widget>[
        Text(
          'data',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          'data',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          'data',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          'data',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          'data',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          'data',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          'data',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }

  ///动态封装ListView，使用ListTile作为item
  Widget listView2() {
    Iterable<Widget> listTiles = items.map<Widget>((String string) {
      return getItem(string);
    });
    ListTile.divideTiles(context: context, tiles: listTiles);
    return ListView(
      children: listTiles.toList(),
    );
  }

  ///使用ListView.builder构造
  Widget listView3() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int position) {
        return getItem(items.elementAt(position));
      },
    );
  }

  ///ListView.custom构建ListView
  Widget listView4() {
    ///SliverChildListDelegate：适用于有固定数量的item的List
    ///SliverChildBuilderDelegate:适用于不固定数量的item的List
    return ListView.custom(
      childrenDelegate:
          SliverChildBuilderDelegate((BuildContext context, int index) {
        return ListTile(
          isThreeLine: true,
          dense: true,
          leading: ExcludeSemantics(
              child: CircleAvatar(child: Text(items.elementAt(index)))),
          title: Text('This item represents .'),
          subtitle: Text("$index"),
          trailing: Icon(Icons.info, color: Theme.of(context).disabledColor),
        );
      }, childCount: 13),
    );
  }

  ///ListView.separated构建ListView
  Widget listView5() {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container(height: 1, color: Colors.pink);
      },
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          isThreeLine: true,
          dense: true,
          leading: ExcludeSemantics(
              child: CircleAvatar(child: Text(items.elementAt(index)))),
          title: Text('This item represents .'),
          subtitle: Text(items.elementAt(index)),
          trailing: Icon(Icons.info, color: Theme.of(context).disabledColor),
        );
      },
    );
  }

  Widget getItem(String item) {
    // if (i.isOdd) {
    //   return Divider();
    // }
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
            dense: true,
            title: Text('Two-line' + item),
            trailing: Radio<_MaterialListType>(
              value: _MaterialListType.twoLine,
              groupValue: _MaterialListType.twoLine,
              onChanged: changeItemType,
            )),
      ),
      onTap: () {
        setState(() {
          // print('row $i');
        });
      },
      onLongPress: () {},
    );
  }

  void changeItemType(_MaterialListType type) {
    print("changeItemType");
  }
}
