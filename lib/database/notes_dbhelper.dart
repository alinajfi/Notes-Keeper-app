import 'dart:async';

import 'package:note_version_2/models/notes_model.dart';
import 'package:note_version_2/utils/dbconsts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class NotesDbHelper {
  NotesDbHelper._();

  static NotesDbHelper? _helper;
  Database? _database;

  factory NotesDbHelper() {
    return _helper ??= NotesDbHelper._();
  }

  Future<Database> _getDataBase() async {
    return _database ??= await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String dbFilePath = path.join(dbPath, DbConstants.dbName);

    return openDatabase(
      dbFilePath,
      version: DbConstants.dbVersion,
      onCreate: _onCreate,
    );
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.execute(DbConstants.createTableCommand);
  }

  Future<void> closeDataBase() async {
    Database db = await _getDataBase();
    db.close();
  }

  //insert into Db

  Future<bool> insertIntoDb(Notes notes) async {
    Map<String, Object?> values = notes.toMap();

    Database db = await _getDataBase();

    int rowId = await db.insert(DbConstants.tableName, values);
    return rowId > 0;
  }

  //read from DataBase

  Future<List<Notes>> viewData() async {
    Database db = await _getDataBase();

    List<Map<String, Object?>> notesMap =
        await db.rawQuery('SELECT * FROM ${DbConstants.tableName}');

    List<Notes> list = notesMap.map((e) => Notes.fromMap(e)).toList();
    return list;
  }

//delete Note
  Future<bool> deleteNote(int noteId) async {
    Database db = await _getDataBase();

    int changes = await db.delete(
      DbConstants.tableName,
      where: '${DbConstants.noteId} = ?',
      whereArgs: [noteId],
    );
//print(changes);

    return changes > 0;
  }

  Future<bool> deleteAllNotes() async {
    Database db = await _getDataBase();

    int changes = await db.delete(DbConstants.tableName);

    return changes > 0;
  }

  Future<bool> updateNote(Notes notes) async {
    Database db = await _getDataBase();

    int changes = await db.update(DbConstants.tableName, notes.toMap(),
        where: '${DbConstants.noteId} = ?', whereArgs: [notes.id]);

    return changes > 0;
  }
}
