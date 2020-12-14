import 'package:bytebank_persistence/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo contato')
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome'
              ),
              style: TextStyle(
                fontSize: 24
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                    labelText: 'Número da conta'
                ),
                style: TextStyle(
                    fontSize: 24
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accountNumber = int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(0, name, accountNumber);
                    Navigator.pop(context, newContact);
                  },
                  child: Text('Criar contato')
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}