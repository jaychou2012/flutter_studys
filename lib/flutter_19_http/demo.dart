void main() {
  //定义int和double类型
  int a = 6;
  double b = 3.18;
  print('$a ,$b');

  // String转int
  int twoInt = int.parse('2');
  // String转double
  var twoDouble = double.parse('2.2');
  print('$twoInt ,$twoDouble');

  // int转String
  String intToString = 2.toString();
  // double转String，后面需加入保留小数点位数
  String doubleToString = 3.23456.toStringAsFixed(2);
  print('$intToString,$doubleToString');

  //自动四舍五入
  String fiveString = 2.13832.toStringAsFixed(2);
  print(fiveString);

  stringDemos();
}

void stringDemos() {
  //单引号和双引号定义
  String singleString = 'A singleString';
  String doubleString = "A doubleString";
  print('$singleString ,$doubleString');

//使用$字符引用变量，使用{}引入表达式
  String userS = 'It\'s $singleString';
  String userExpression = 'It\'s expression,${singleString.toUpperCase()}';
  print('$userS');
  print('$userExpression');

//使用引号字符串邻接来拼接或者使用+号连接字符串
  String stringLines =
      'String ' 'concatenation' " works even over line breaks.";
  String addString = 'A and ' + 'B';
  print('$stringLines');
  print('$addString');

//使用三个引号（单引号或双引号）来创建多行字符串
  String s3 = '''
You can create
multi-line strings like this one.
''';
  String s33 = """This is also a
multi-line string.""";
  print('$s3');
  print('$s33');

//使用r为开头，显示定义一个原始字符串
  String s = r"It is a \n raw string.";
  print('$s');
}

void listDemo() {
  //定义初始化一个集合
  var list = [1, 2, 3];
  List listData = [5, 6, 7];
  print(list.length);
  print(list[0]);
  //集合数据赋值
  listData[1] = 8;
  print(listData[1]);
  //如果在集合前加了const关键字，集合数据不可以进行操作
  var constantList = const [1, 2, 3];
  List datas = List();
  datas.add('data1');
  datas.addAll(['data2', 'data3', 'data4', 'data5', 'data6']);
  //输出第一个元素
  print(datas.first);
  // 获取最后一个元素
  print(datas.last);
  // 获取元素的位置
  print(datas.indexOf('data1'));
  // 删除指定位置元素
  print(datas.removeAt(2));
  //删除元素
  datas.remove('data1');
  //删除最后一个元素
  datas.removeLast();
  // 删除指定范围元素，含头不含尾
  datas.removeRange(0, 2);
  //删除指定条件的元素
  datas.removeWhere((item) => item.length > 3);
  // 删除所有的元素
  datas.clear();
}

void mapDemos() {
  //定义一个map并赋值
  var gifts = {
// Keys      Values
    'first': 'dog',
    'second': 'cat',
    'fifth': 'orange'
  };

  var nobleGases = {
// Keys  Values
    2: 'a',
    10: 'b',
    18: 'b',
  };
//定义一个map并赋值
  Map map = Map();
  map['first'] = 'a-value';
  map['second'] = 'b-value';
  map['fifth'] = 'c-value';
  Map nobleGasesMap = Map();
  nobleGasesMap[2] = 'a-value';
  nobleGasesMap[10] = 'b-value';
  nobleGasesMap[18] = 'c-value';

  //获取某个key的value
  print(map['first']);
  //获取map大小
  print(map.length);
  //定义一个不可变的map
  final constantMap = const {
    2: 'a',
    10: 'b',
    18: 'c',
  };
  //其他API用法和List类似
}

void statementsDemos() {
  //if和else
  if (hasData()) {
    print("hasData");
  } else if (hasString()) {
    print("hasString");
  } else {
    print("noStringData");
  }

  //for循环
  var message = new StringBuffer("Dart is good");
  for (var i = 0; i < 6; i++) {
    message.write(',');
  }

  //while
  while (okString()) {
    print('ok');
  }
//do-while
  do {
    print('okDo');
  } while (!hasData());

  //break和continue
  while (true) {
    if (noData()) {
      break;
    }
    if (hasData()) {
      continue;
    }
    doSomething();
  }

  //switch和case
  var command = 'OPEN';
  switch (command) {
    case 'A':
      executeA();
      break;
    case 'B':
      executeB();
      break;
    case 'C':
      executeC();
      break;
    default:
      executeUnknown();
  }

  //Assert（断言）
  assert(string != null);
  assert(number < 80);
  assert(urlString.startsWith('https'));
}