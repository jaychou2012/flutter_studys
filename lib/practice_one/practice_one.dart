// 仿照Instagram列表页
import 'package:flutter/material.dart';

import 'practice_one_login.dart';

class PracticeOneSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PracticeOneSamplesState();
  }
}

class PracticeOneSamplesState extends State<PracticeOneSamples>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String imageUrl =
      'https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=eaad8629b0096b63951456026d5aec21/342ac65c103853431b19c6279d13b07ecb8088e6.jpg';
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // 用Scaffold构建页面布局框架
    return Scaffold(
      // AppBar构建页面标题栏
      appBar: AppBar(
        title: Text('PracticeOne Widget'),
        primary: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        // 点击跳转页面
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                gotoPage();
              }),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    child: Text("热度"),
                    value: "hot",
                  ),
                  PopupMenuItem<String>(
                    child: Text("最新"),
                    value: "new",
                  ),
                ],
            onSelected: (String action) {
              switch (action) {
                case "hot":
                  print("hot");
                  break;
                case "new":
                  print("new");
                  break;
              }
            },
            onCanceled: () {
              print("onCanceled");
            },
          )
        ],
        // 加入TabBar功能
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: "最新",
            ),
            Tab(
              text: "关注",
            ),
            Tab(
              text: "搜搜",
            ),
            Tab(
              text: "热门",
            ),
            Tab(
              text: "我的",
            ),
          ],
        ),
      ),
      // 主体内容布局
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                getTabOne(),
                getTabOne(),
              ],
            ),
          ),
          Center(
            child: Text("data2"),
          ),
          Center(
            child: Text("data3"),
          ),
          Center(
            child: Text("data4"),
          ),
          Center(
            child: Text("data5"),
          ),
        ],
      ),
    );
  }

  // 主体内容布局
  Widget getTabOne() {
    return Padding(
      // 四周加入内容页内边距
      padding: EdgeInsets.only(top: 10,left: 10,right: 10,),
      // 使用Column纵向线性布局
      child: Column(
        children: <Widget>[
          // 对图片进行个性化圆角美化处理
          ClipRRect(
            // 使用Stack层叠布局实现右下角红色Tag标签角标
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Image.network(
                  imageUrl,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
                // 右下角红色Tag标签角标
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'best',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                )
              ],
            ),
            // 个性化圆角处理
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          // 标题设置，居左居中
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '2019春天来了~',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          // 用Row横向线性布局来实现数据展示
          Row(
            children: <Widget>[
              Text(
                '2000 浏览 .',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              Text(
                '126 喜欢 .',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              Text(
                '132 评论',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
          // 设置间隔
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              // 圆形头像
              Container(
                width: 26,
                height: 26,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/assets_image.png"),
                  radius: 50.0,
                ),
              ),
              // 昵称
              Text(
                '   哎呦不错 ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              // 认证图标Icon
              Icon(
                Icons.verified_user,
                size: 15,
                color: Colors.teal,
              ),
              // 用Expanded来实现发表时间居右显示，宽度占用横向剩余空间
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ' 5 分钟前',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          // 分隔线
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            width: MediaQuery.of(context).size.width,
            height: 0.2,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
  // 页面跳转，跳转到登录页
  void gotoPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PracticeOneLoginSamples();
    }));
  }
}
