import 'package:bytebank_persistence/components/progress.dart';
import 'package:bytebank_persistence/database/app_database.dart';
import 'package:bytebank_persistence/models/contact.dart';
import 'package:bytebank_persistence/models/contact_dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'contact_form.dart';

class ContactsList extends StatefulWidget {
  @override
  ContactsListState createState() => ContactsListState();
}

class ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder<List<Contact>>(
        future: _dao.findAll(),
        initialData: List<Contact>(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active: break;
            case ConnectionState.none: break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ContactItem(contacts[index]);
                },
                itemCount: contacts.length,
              );
          }
          return Text('Erro desconhecido');
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactForm()));
            setState(() {});
          },
          child: Icon(Icons.add)),
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
        title: Text(contact.name, style: TextStyle(fontSize: 24.0)),
        subtitle: Text(contact.accountNumber.toString(),
            style: TextStyle(fontSize: 16.0)),
      ),
    );
  }
}
