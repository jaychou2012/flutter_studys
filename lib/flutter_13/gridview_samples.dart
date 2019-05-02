/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:39 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:39 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridViewSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridViewSamplesState();
  }
}

class GridViewSamplesState extends State<GridViewSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
        backgroundColor: Colors.teal,
        primary: true,
      ),
      body: gridView1(),
    );
  }

  Widget gridView1() {
    return GridView(
      ///设置Grid属性：
      ///SliverGridDelegateWithMaxCrossAxisExtent：
      ///按照设置最大扩展宽度计算item个数
      ///SliverGridDelegateWithFixedCrossAxisCount:
      ///可以固定设置每行item个数
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: <Widget>[
        Image.asset(
          'assets/image_appbar.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/image_appbar.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/image_appbar.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/image_appbar.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/image_appbar.jpg',
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget gridView2() {
    return GridView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          header: GridTileBar(
            title: Text(
              'header',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
            leading: Icon(
              Icons.star,
              color: Colors.white,
            ),
          ),
          child: Image.asset('assets/image_appbar.jpg'),
          footer: GridTileBar(
            title: Text(
              'bottom',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }

  Widget gridView3() {
    return GridView.custom(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2,
      ),
      childrenDelegate:
          SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Text(
            'GridTile',
            style: TextStyle(fontSize: 16),
          ),
        );
      }, childCount: 20),
    );
  }

  Widget gridView4() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1,
      children: <Widget>[
        GridTile(
          child: Image.asset('assets/image_appbar.jpg'),
        ),
        GridTile(
          child: Image.asset('assets/image_appbar.jpg'),
        ),
        GridTile(
          child: Image.asset('assets/image_appbar.jpg'),
        ),
        GridTile(
          child: Image.asset('assets/image_appbar.jpg'),
        ),
        GridTile(
          child: Image.asset('assets/image_appbar.jpg'),
        ),
        GridTile(
          child: Image.asset('assets/image_appbar.jpg'),
        ),
      ],
    );
  }

  ///GridView.extent构建GridView，根据最大宽度自动计算item数量
  Widget gridView5() {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1,
      children: <Widget>[
        GridTile(
          header: GridTileBar(
            title: Text(
              'header',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
            leading: Icon(
              Icons.star,
              color: Colors.white,
            ),
          ),
          child: Image.asset('assets/image_appbar.jpg'),
          footer: GridTileBar(
            title: Text(
              'bottom',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
          ),
        ),
        GridTile(
          header: GridTileBar(
            title: Text(
              'header',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
            leading: Icon(
              Icons.star,
              color: Colors.white,
            ),
          ),
          child: Image.asset('assets/image_appbar.jpg'),
          footer: GridTileBar(
            title: Text(
              'bottom',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
          ),
        ),
        GridTile(
          header: GridTileBar(
            title: Text(
              'header',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
            leading: Icon(
              Icons.star,
              color: Colors.white,
            ),
          ),
          child: Image.asset('assets/image_appbar.jpg'),
          footer: GridTileBar(
            title: Text(
              'bottom',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
          ),
        ),
        GridTile(
          header: GridTileBar(
            title: Text(
              'header',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
            leading: Icon(
              Icons.star,
              color: Colors.white,
            ),
          ),
          child: Image.asset('assets/image_appbar.jpg'),
          footer: GridTileBar(
            title: Text(
              'bottom',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
          ),
        ),
        GridTile(
          header: GridTileBar(
            title: Text(
              'header',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
            leading: Icon(
              Icons.star,
              color: Colors.white,
            ),
          ),
          child: Image.asset('assets/image_appbar.jpg'),
          footer: GridTileBar(
            title: Text(
              'bottom',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
          ),
        ),
        GridTile(
          header: GridTileBar(
            title: Text(
              'header',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
            leading: Icon(
              Icons.star,
              color: Colors.white,
            ),
          ),
          child: Image.asset('assets/image_appbar.jpg'),
          footer: GridTileBar(
            title: Text(
              'bottom',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.black45,
          ),
        ),
      ],
    );
  }
}
