import 'package:bytebank_persistence/screens/contacts_list.dart';
import 'package:flutter/material.dart';
import 'database/app_database.dart';
import 'models/contact.dart';

// 8.7

void main() {
  runApp(Bytebank());
  save(Contact(1, 'Guilherme', 1234)).then((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
}

// ripple


class Bytebank extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: ContactsList()
    );
  }
}
