import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_form.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),

      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Guilherme'),
              subtitle: Text('1234'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => ContactForm()
              )).then((newContact) => debugPrint(newContact.toString()));
        },
        child: Icon(Icons.add)
      ),
    );
  }

}