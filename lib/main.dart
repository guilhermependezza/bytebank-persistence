import 'package:bytebank_persistence/screens/contacts_list.dart';
import 'package:flutter/material.dart';
import 'screens/contact_form.dart';
import 'screens/dashboard.dart';

void main() => runApp(Bytebank());

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
