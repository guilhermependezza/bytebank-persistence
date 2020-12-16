import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bytebank_persistence/database/app_database.dart';
import 'contact.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id. INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    return db.insert('contacts', _toMap(contact));
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return maps
        .map<Contact>((map) => Contact(map[_id], map[_name], map[_accountNumber]))
        .toList();
  }
}