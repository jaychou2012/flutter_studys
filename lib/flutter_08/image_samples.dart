/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:42 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:42 
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImageSamplesState();
  }
}

class ImageSamplesState extends State<ImageSamples> {
  ImageInfo imageInfo;
  String imageUrl =
      'https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=eaad8629b0096b63951456026d5aec21/342ac65c103853431b19c6279d13b07ecb8088e6.jpg';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ///图片加载监听处理
    Image.asset("assets/flutter-mark-square-64.png")
        .image
        .resolve(createLocalImageConfiguration(context))
        .addListener(
            ImageStreamListener((ImageInfo image, bool synchronousCall) {
          imageInfo = image;
        }, onError: (dynamic exception, StackTrace stackTrace) {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Widget"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  //从项目目录里读取图片，需要在pubspec.yaml注册路径
                  Image.asset("assets/assets_image.png"),
                  Text(
                    "项目asset目录里读取",
                    textAlign: TextAlign.center,
                  ),
                  Image(
                    image: AssetImage("assets/assets_image.png"),
                    width: 200,
                    height: 130,
                  ),
                  Text(
                    "AssetImage读取",
                    textAlign: TextAlign.center,
                  ),
                  //从文件读取图片
                  Image.file(
                    File('/sdcard/img.png'),
                    width: 200,
                    height: 80,
                  ),
                  Image(
                    image: FileImage(File('/sdcard/img.png')),
                  ),

                  ///读取加载原始图片
                  // RawImage(
                  //   image: imageInfo?.image,
                  // ),

                  ///内存中读取byte数组图片
                  /// Image.memory(bytes)
                  /// Image(
                  ///   image: MemoryImage(bytes),
                  /// ),

                  // 读取网络图片
                  Image.network(imageUrl),
                  Text(
                    "读取网络图片",
                    textAlign: TextAlign.center,
                  ),
                  Image(
                    image: NetworkImage(imageUrl),
                  ),
                  Text(
                    "用NetworkImage读取网络图片",
                    textAlign: TextAlign.center,
                  ),

                  ///加入占位图的加载图片
                  FadeInImage(
                    placeholder: AssetImage("assets/assets_image.png"),
                    image: FileImage(File('/sdcard/img.png')),
                  ),
                  Text(
                    "加入占位图的加载图片",
                    textAlign: TextAlign.center,
                  ),
                  FadeInImage.assetNetwork(
                    placeholder: "assets/assets_image.png",
                    image: imageUrl,
                  ),

                  /// FadeInImage.memoryNetwork(
                  ///   placeholder: byte,
                  ///   image: imageUrL,
                  /// ),

                  ///加载圆角图片
                  CircleAvatar(
                    backgroundColor: Colors.brown.shade800,
                    child: Text("圆角头像"),
                    backgroundImage: AssetImage("assets/assets_image.png"),
                    radius: 50.0,
                  ),
                  Text(
                    "加载圆角图片",
                    textAlign: TextAlign.center,
                  ),
                  ImageIcon(NetworkImage(imageUrl)),
                  Text(
                    "ImageIcon",
                    textAlign: TextAlign.center,
                  ),
                  ClipRRect(
                    child: Image.network(
                      imageUrl,
                      scale: 8.5,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  Text(
                    "ClipRRect",
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.cover),
                    ),
                  ),
                  Text(
                    "BoxDecoration",
                    textAlign: TextAlign.center,
                  ),
                  ClipOval(
                    child: Image.network(
                      imageUrl,
                      scale: 8.5,
                    ),
                  ),
                  Text(
                    "ClipOval",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
