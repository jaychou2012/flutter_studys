import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// 实现一个淘宝风格的商品展示列表

class PracticeTwoSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PracticeTwoSamplesState();
  }
}

class PracticeTwoSamplesState extends State<PracticeTwoSamples>
    with SingleTickerProviderStateMixin {
  // 页面切换TabController
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 定义顶部标题栏
      appBar: AppBar(
        primary: true,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Container(
          padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
          child: TextField(
            maxLines: 1,
            autofocus: false,
            // TextFiled装饰
            decoration: InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.all(10),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    gapPadding: 0,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: '衬衫男',
                suffixIcon: Icon(Icons.photo_camera)),
          ),
        ),
        centerTitle: true,
        // 右侧收起的更多按钮菜单
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    child: Text("消息"),
                    value: "message",
                  ),
                  PopupMenuItem<String>(
                    child: Text("分享"),
                    value: "share",
                  ),
                ],
            onSelected: (String action) {
              switch (action) {
                case "message":
                  print("message");
                  break;
                case "share":
                  print("share");
                  break;
              }
            },
            onCanceled: () {
              print("onCanceled");
            },
          )
        ],
        // 紧挨着标题栏AppBar的TabBar
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          // 标签选中颜色
          labelColor: Color.fromRGBO(247, 70, 0, 1),
          unselectedLabelColor: Colors.black,
          indicatorColor: Color.fromRGBO(247, 70, 0, 1),
          indicatorSize: TabBarIndicatorSize.label,
          // 几个Tab按钮
          tabs: <Widget>[
            Tab(
              text: "全部",
            ),
            Tab(
              text: "天猫",
            ),
            Tab(
              text: "店铺",
            ),
            Tab(
              text: "淘宝经验",
            ),
          ],
        ),
      ),
      // 右下角悬浮的按钮Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        mini: true,
        elevation: 1,
        highlightElevation: 2,
        child: Icon(
          Icons.vertical_align_top,
        ),
      ),
      // 主体部分布局内容，使用了TabBarView
      body: TabBarView(
        controller: _tabController,
        // 内部切换页布局内容
        children: <Widget>[
          getPage1(),
          getPage1(),
          Center(
            child: Text("data3"),
          ),
          Center(
            child: Text("data4"),
          ),
        ],
      ),
    );
  }

  // 将页面布局单独提取出来写，方便
  Widget getPage1() {
    // 建议最外层使用Container包裹一层
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      // 内部页面使用CustomScrollView来实现滚动效果
      child: CustomScrollView(slivers: <Widget>[
        // 放置一个可推上去的顶部的标题栏
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverAppBarDelegate(
              maxHeight: 30,
              minHeight: 30,
              child: Container(
                height: 30,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text('淘宝购物悬浮Header'),
              )),
        ),
        // 放置一个固定的顶部的标题栏
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
              maxHeight: 30,
              minHeight: 30,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(5),
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '综合',
                          style: TextStyle(color: Colors.orange),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Text(
                      '销量',
                      style: TextStyle(color: Colors.black),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '筛选 ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(
                          Icons.filter_vintage,
                          color: Colors.black,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
        // 列表内容，使用SliverList实现
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              // 每条内容的布局Item
              child: getItem(),
            );
          },
                  // 定义了60条Item数据
                  childCount: 60),
        )
      ]),
    );
  }

  // 每条内容的布局Item
  Widget getItem() {
    return Container(
        padding: EdgeInsets.all(5),
        child: Row(children: <Widget>[
          // 圆角图片
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/778081993/O1CN01R7Ytfe1QapseIzl8o_!!778081993.jpg_250x250.jpg_.webp',
              height: 108,
            ),
          ),
          // 用SizedBox增加间距
          SizedBox(
            width: 10,
          ),
          // 右侧的商品描述信息
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 6,
              ),
              Row(
                children: <Widget>[
                  // 天猫的标签实现
                  Container(
                    padding:
                        EdgeInsets.only(left: 1, right: 1, top: 0, bottom: 0),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        border:
                            Border.all(color: Color(0xFFFF0000), width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      '天猫',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  // 商品标题
                  Text(
                    ' 夏季格子男士韩版修身薄款休闲棉衬衣 ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    softWrap: true,
                  )
                ],
              ),
              SizedBox(
                height: 3,
              ),
              // 商品特征属性
              Text(
                '格子布面料 | 方领 | 薄面料',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(
                height: 3,
              ),
              // 两个横向标签
              Row(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.only(left: 3, right: 3, top: 1, bottom: 1),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xFFFF0000), width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      '天猫无忧购',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 3, right: 3, top: 1, bottom: 1),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      '包邮',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3,
              ),
              // 价格信息
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '￥',
                    style: TextStyle(color: Colors.orange, fontSize: 12),
                  ),
                  Text(
                    '78',
                    style: TextStyle(color: Colors.orange, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '530人付款  杭州',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              // Item底部店铺信息
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '哥尼诺旗舰店',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    '  进店 >',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              )
            ],
          )
        ]));
  }
}

// SliverPersistentHeader的SliverPersistentHeaderDelegate实现
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
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
