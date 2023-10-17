import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: """ CREATE TABLE tarefas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT,
        concluido INTEGER
  );
""",
};

class SqliteDataBase {
  static Database? db;

  Future<Database> obterDatabase() async {
    if (db == null) {
      return await iniciarBancoDeDados();
    } else {
      return db!;
    }
  }

  Future iniciarBancoDeDados() async {
    var db = await openDatabase(
      path.join(await getDatabasesPath(), "database.db"),
      version: scripts.length,
      onCreate: (Database db, int version) async {
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        for (var i = 1; oldVersion + 1 <= scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
    );
    return db;
  }
}
