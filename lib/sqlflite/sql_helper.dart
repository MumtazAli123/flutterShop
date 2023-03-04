import 'package:flutter/foundation.dart';
import 'package:nodejs/models/photo.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class SQLHelper {

  static Future<void> createTable(sql.Database database) async {
    await database.execute("""Create Table items(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT,
    description TEXT, productPic String,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }

  static Future<sql.Database> db() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, sql.Database as String?);


    return sql.openDatabase('beseech.db', version: 1,
        onCreate: (sql.Database database, int version) async {
          if (kDebugMode) {
            print("...creating Table");
          }
          await createTable(database);
        });
  }

  static Future<int> createItem(
      String title,
      String description,
      String productPic,

      ) async {

    final dbClient = await SQLHelper.db();
    final data = {
      'title': title,
      'description': description,
      'productPic': productPic,
    };
    final id = await dbClient.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final dbClient = await SQLHelper.db();
    List<Photo> photos =[];

    return dbClient.query('items', orderBy: "id", );

  }
  Future close ()async{
    var dbClient = await db();
    dbClient.close();
  }


  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final dbClient = await SQLHelper.db();
    return dbClient.query('table', where: "id = ?", whereArgs: [id], limit: 1);
  }


  static Future<int> updateItem(
      int id, String title, String? description, String productPic) async {
    final db = await SQLHelper.db();
    final data = {
      'title': title,
      'productPic': productPic,
      'description': description,
      'createdAt': DateTime.now().toString()
    };
    final result =
    await db.update('items', data, where: "id = ? ", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final dbClient = await SQLHelper.db();
    try {
      await dbClient.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when an item: $err");
    }
  }
}