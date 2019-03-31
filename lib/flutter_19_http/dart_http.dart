import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class DartHttpUtils {
  //创建client实例
  var _client = http.Client();

  //发送GET请求
  getClient() async {
    var url = "https://abc.com:8090/path1?name=abc&pwd=123";
    _client.get(url).then((http.Response response) {
      //处理响应信息
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('error');
      }
    });
  }

//发送POST请求，application/x-www-form-urlencoded
  postUrlencodedClient() async {
    var url = "https://abc.com:8090/path2";
    //设置header
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = "application/x-www-form-urlencoded";
    //设置body参数
    Map<String, String> bodyParams = new Map();
    bodyParams["name"] = "value1";
    bodyParams["pwd"] = "value2";
    _client
        .post(url, headers: headersMap, body: bodyParams, encoding: Utf8Codec())
        .then((http.Response response) {
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('error');
      }
    }).catchError((error) {
      print('error');
    });
  }

  //发送POST请求，application/json
  postJsonClient() async {
    var url = "https://abc.com:8090/path3";
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();
    Map<String, String> bodyParams = new Map();
    bodyParams["name"] = "value1";
    bodyParams["pwd"] = "value2";
    _client
        .post(url,
            headers: headersMap,
            body: jsonEncode(bodyParams),
            encoding: Utf8Codec())
        .then((http.Response response) {
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('error');
      }
    }).catchError((error) {
      print('error');
    });
  }

  // 发送POST请求，multipart/form-data
  postFormDataClient() async {
    var url = "https://abc.com:8090/path4";
    var client = new http.MultipartRequest("post", Uri.parse(url));
    client.fields["name"] = "value1";
    client.fields["pwd"] = "value2";
    client.send().then((http.StreamedResponse response) {
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print('error');
      }
    }).catchError((error) {
      print('error');
    });
  }

// 发送POST请求，multipart/form-data，上传文件
  postFileClient() async {
    var url = "https://abc.com:8090/path5";
    var client = new http.MultipartRequest("post", Uri.parse(url));
    http.MultipartFile.fromPath('file', 'sdcard/img.png',
            filename: 'img.png', contentType: MediaType('image', 'png'))
        .then((http.MultipartFile file) {
      client.files.add(file);
      client.fields["description"] = "descriptiondescription";
      client.send().then((http.StreamedResponse response) {
        if (response.statusCode == 200) {
          response.stream.transform(utf8.decoder).join().then((String string) {
            print(string);
          });
        } else {
          response.stream.transform(utf8.decoder).join().then((String string) {
            print(string);
          });
        }
      }).catchError((error) {
        print(error);
      });
    });
  }
}
