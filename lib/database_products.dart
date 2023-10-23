import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'my_database.db';
  static const int DATABASE_VERSION = 2;

  static Database? _database;

  static Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await openDatabase(
      join((await getApplicationDocumentsDirectory()).path, DATABASE_NAME),
      version: DATABASE_VERSION,
      onCreate: (db, version) async {
        await db.execute('PRAGMA foreign_keys = ON');
        await db.execute('''
          CREATE TABLE Categories (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE Products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            description TEXT,
            category_id INTEGER,
            FOREIGN KEY (category_id) REFERENCES Categories(id) ON DELETE NO ACTION ON UPDATE NO ACTION
          )
        ''');



      },
    );

    return _database;
  }

// Methods for inserting, updating, and deleting Product and Category data
}