import 'package:bytebank_persistence/screens/dashboard.dart';
import 'package:flutter/material.dart';

// 13.5

void main() {
  runApp(Bytebank());
}

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
      home: Dashboard()
    );
  }
}
