import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomScrollViewSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomScrollViewSamplesState();
  }
}

class CustomScrollViewSamplesState extends State<CustomScrollViewSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getScaffoldCustomScrollView();
   
  }

  Widget getMaterialCustomScrollView(){
     return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('CustomScrollView'),
              background: Image.asset("assets/image_appbar.jpg",fit: BoxFit.cover,),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

Widget getScaffoldCustomScrollView(){
  return Scaffold(
      appBar: AppBar(
        title: Text("CustomScrollView"),
      ),
      body: Material(
        child: customScrollview1(),
      ),
    );
}

ScrollController _scrollController =
    ScrollController(initialScrollOffset: 5, keepScrollOffset: true);

///SliverList，SliverFixedExtentList,SliverGrid
///SliverPadding,SliverAppBar
///ScrollNotification,IndexedSemantics
Widget customScrollview1() {
  _scrollController.addListener(() {
    ///滚动监听
  });
  return CustomScrollView(
    shrinkWrap: false,
    primary: false,
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical,
    controller: _scrollController,
    slivers: <Widget>[
      ///SliverGrid用法
      SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (index % 9)],
              child: Text(
                'grid item $index',
                style: TextStyle(fontSize: 12, decoration: TextDecoration.none),
              ),
            );
          },
          childCount: 20,
        ),

        ///设置Grid属性：
        ///SliverGridDelegateWithMaxCrossAxisExtent：
        ///按照设置最大扩展宽度计算item个数
        ///SliverGridDelegateWithFixedCrossAxisCount:
        ///可以固定设置每行item个数
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,

          ///item高度缩放比例，默认为1；小于1表示放大，大于1表示缩小
          childAspectRatio: 1,
        ),
        //  SliverGridDelegateWithMaxCrossAxisExtent(
        //   ///item最大宽度
        //   maxCrossAxisExtent: 400.0,
        //   mainAxisSpacing: 10.0,
        //   crossAxisSpacing: 10.0,
        //   childAspectRatio: 4.0,
        // ),
      ),

      ///SliverChildListDelegate：适用于有固定数量的item的List
      ///SliverChildBuilderDelegate:适用于不固定数量的item的List

      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text(
              'SliverList item $index',
              style: TextStyle(fontSize: 12, decoration: TextDecoration.none),
            ),
          );
        }, childCount: 20),
      ),
      SliverPersistentHeader(
        delegate: _SliverAppBarDelegate(
          minHeight: 60.0,
          maxHeight: 180.0,
          child: Container(
            color: Colors.pink,
            child: Image.asset("assets/image_appbar.jpg",fit: BoxFit.cover,),
          ),
        ),
      ),

      ///指定item高度的List
      SliverFixedExtentList(
        ///item固定高度
        itemExtent: 50,
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: Text(
                'list item $index',
                style: TextStyle(fontSize: 12, decoration: TextDecoration.none),
              ),
            );
          },
          childCount: 20,
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate(<Widget>[
          Text(
            "SliverList SliverChildListDelegate",
            style: TextStyle(fontSize: 12, decoration: TextDecoration.none),
          ),
          Image.asset("assets/flutter-mark-square-64.png"),
        ]),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(10.0),
        sliver: SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            Text(
              "SliverPadding SliverChildListDelegate",
              style: TextStyle(fontSize: 12, decoration: TextDecoration.none),
            ),
            Image.asset("assets/flutter-mark-square-64.png"),
          ]),
        ),
      ),
      SliverToBoxAdapter(
        child: Text(
          "SliverToBoxAdapter",
          style: TextStyle(fontSize: 16, decoration: TextDecoration.none),
        ),
      ),
    ],
  );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
