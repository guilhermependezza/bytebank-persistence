import 'package:bytebank_persistence/models/contact.dart';
import 'package:bytebank_persistence/models/contact_dao.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');

  return openDatabase(path,
    // onDowngrade: onDatabaseDowngradeDelete,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    }, version: 1);
}
