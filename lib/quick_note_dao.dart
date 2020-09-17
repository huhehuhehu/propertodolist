import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';
import 'quick_note.dart';
import 'constants.dart';

class QuicknotesDao{
  final dbProvider = DatabaseProvider.dbProvider;


  Future<void> insertQuicknote(Quicknote q) async{
    final db = await dbProvider.database;
    db.insert(tableName, q.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Quicknote>> getAllQuicknotes() async{
    final db = await dbProvider.database;
    final List<Map<String, dynamic>> data = await db.query(tableName);

    List<Quicknote> q = [];
    if(data.length == 0) return q;

    for(int i = 0; i < data.length; i++) {
      q.add(Quicknote(content: data[i][Column_name], id: data[i][Column_id]));
    }
    return q;
  }

  Future<void> deleteQuicknote(int id) async{
    final db = await dbProvider.database;
    var dodo = await db;
    await dodo.rawDelete('DELETE FROM $tableName WHERE $Column_id = $id');

  }

  Future<void> editQuicknote(int index, String s) async{
    final db = await dbProvider.database;
    var res = await db.update(tableName, Quicknote(content: s, id: index).toMap(),
        where: "id = ?", whereArgs: [index]);
    return res;
  }
}