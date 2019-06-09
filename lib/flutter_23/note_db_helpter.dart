import 'package:sqflite/sqflite.dart';

import 'Note.dart';

// 数据库操作工具类
class NoteDbHelper {
  Database db;

  Future open(String path) async {
    // 打开/创建数据库
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table Notes ( 
  _id integer primary key autoincrement, 
  title text not null,
  content text not null)
''');
    });
  }

  Database getDatabase(){
    return db;
  }

  // 增加一条数据
  Future<Note> insert(Note note) async {
    note.id = await db.insert("notes", note.toMap());
    return note;
  }

  // 通过ID查询一条数据
  Future<Note> getNoteById(int id) async {
    List<Map> maps = await db.query('notes',
        columns: [columnId, columnTitle, columnContent],
        where: '_id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Note.fromMap(maps.first);
    }
    return null;
  }

  // 通过ID删除一条数据
  Future<int> deleteById(int id) async {
    return await db.delete('notes', where: '_id = ?', whereArgs: [id]);
  }

  // 更新数据
  Future<int> update(Note note) async {
    return await db.update('notes', note.toMap(),
        where: '_id = ?', whereArgs: [note.id]);
  }

  // 关闭数据库
  Future close() async => db.close();
}
