import 'package:bytebank_persistence/components/feature_item.dart';
import 'package:bytebank_persistence/screens/contacts_list.dart';
import 'package:bytebank_persistence/screens/transactions_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Function _withContext(context, callback) => () => callback(context);

  void _newTransactionClick(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactsList()));
  }

  void _transactionListClick(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransactionsList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/bytebank_logo.png'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FeatureItem('Nova Transferencia', Icons.monetization_on, onClick: _withContext(context, _newTransactionClick)),
                  FeatureItem('Lista Transferencia', Icons.add, onClick: _withContext(context, _transactionListClick)),
                ],
              ),
            )
          ],
        )
    );
  }
}
