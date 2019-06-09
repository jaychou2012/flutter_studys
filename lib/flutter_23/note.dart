final String tableName = 'notes';// 表名
final String columnId = '_id';// 属性名
final String columnTitle = 'title';// 属性名
final String columnContent = 'content';// 属性名

// 实体类
class Note {
  int id;
  String title;
  String content;

  // 将实体对象类转为数据集合
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: title,
      columnContent: content,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  // 构造方法/实例化方法
  Note();

  // 通过数据集合返回一个实体对象
  Note.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    content = map[columnContent];
  }
}
