import 'package:bytebank_persistence/models/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_form.dart';

class ContactsList extends StatelessWidget {
  final List<Contact> contacts = List();
  @override
  Widget build(BuildContext context) {
    contacts.add(Contact(0, 'Guilherme', 1234));
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),

      body: ListView.builder(
        itemBuilder: (context, index) {
          return ContactItem(contacts[index]);
        },
        itemCount: contacts.length,
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

class ContactItem extends StatelessWidget {
  final Contact contact;

  ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Guilherme', style: TextStyle(fontSize: 24.0)),
        subtitle: Text('1234', style: TextStyle(fontSize: 16.0)),
      ),
    );
  }
}
