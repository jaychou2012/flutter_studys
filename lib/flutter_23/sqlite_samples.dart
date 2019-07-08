import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Note.dart';
import 'note_db_helpter.dart';

class SQLiteSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SQLiteSamplesState();
  }
}

class SQLiteSamplesState extends State<SQLiteSamples> {
  NoteDbHelper noteDbHelpter;

  @override
  void initState() {
    super.initState();
    noteDbHelpter = NoteDbHelper();
    String databasesPath = getDatabasesPath().toString();
    String path = join(databasesPath, 'notesDb.db');
    noteDbHelpter.open(path);

    noteDbHelpter.getNoteById(1).then((Note note) {
      print(note.title);
    });

    // 也可以这样使用
    noteDbHelpter
        .getDatabase()
        .query('notes')
        .then((List<Map<String, dynamic>> records) {
      Map<String, dynamic> mapRead = records.first;
      // 读取属性值
      mapRead['title'] = '1';
      // 如果想修改的话
      Map<String, dynamic> map = Map<String, dynamic>.from(mapRead);
      // 更新修改
      map['title'] = '2';
    });

    // 支持原始SQL语句使用
    noteDbHelpter.getDatabase().rawUpdate(
        'UPDATE notes SET title = ?, content = ? WHERE _id = ?',
        ['my title', 'my content', 2]).then((int count) {
      print('updated: $count');
    });
  }

  @override
  Widget build(BuildContext context) {
    return getstureMove(context);
  }

  Widget getstureMove(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite'),
      ),
      body: Container(
          child: Stack(
        children: <Widget>[Text('SQLite')],
      )),
    );
  }
}
