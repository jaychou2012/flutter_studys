import 'dart:convert';
import 'dart:io';

class IOHttpUtils {
  //创建HttpClient
  HttpClient _httpClient = HttpClient();

  //要用async关键字异步请求
  getHttpClient() async {
    _httpClient
        .get('https://abc.com', 8090, '/path1')
        .then((HttpClientRequest request) {
      //在这里可以对request请求添加headers操作，写入请求对象数据等等
      // Then call close.
      return request.close();
    }).then((HttpClientResponse response) {
      // 处理response响应
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print("error");
      }
    });
  }

  getUrlHttpClient() async {
    var url = "https://abc.com:8090/path1";
    _httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
      // Optionally set up headers...
      // Optionally write to the request object...
      // Then call close.
      return request.close();
    }).then((HttpClientResponse response) {
      // Process the response.
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print("error");
      }
    });
  }

  //进行POST请求
  postHttpClient() async {
    _httpClient
        .post('https://abc.com', 8090, '/path2')
        .then((HttpClientRequest request) {
      //这里添加POST请求Body的ContentType和内容
      //这个是application/json数据类型的传输方式
      request.headers.contentType = ContentType("application", "json");
      request.write("{\"name\":\"value1\",\"pwd\":\"value2\"}");
      return request.close();
    }).then((HttpClientResponse response) {
      // Process the response.
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print("error");
      }
    });
  }

  postUrlHttpClient() async {
    var url = "https://abc.com:8090/path2";
    _httpClient.postUrl(Uri.parse(url)).then((HttpClientRequest request) {
      //这里添加POST请求Body的ContentType和内容
      //这个是application/x-www-form-urlencoded数据类型的传输方式
      request.headers.contentType =
          ContentType("application", "x-www-form-urlencoded");
      request.write("name='value1'&pwd='value2'");
      return request.close();
    }).then((HttpClientResponse response) {
      // Process the response.
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print("error");
      }
    });
  }

  ///其余的HEAD、PUT、DELETE请求用法类似，大同小异，大家可以自己试一下
  ///在Widget里请求成功数据后，使用setState来更新内容和状态即可
  ///setState(() {
  ///    ...
  ///  });

}
