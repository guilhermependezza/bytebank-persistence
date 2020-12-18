import 'dart:convert';

import 'package:bytebank_persistence/models/contact.dart';
import 'package:bytebank_persistence/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

import 'logging_interceptor.dart';

class TransactionWebClient {
  final Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final String baseUrl = 'http://192.168.15.5:8080/transactions';

  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(baseUrl);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return _toTransactions(decodedJson);
  }

  List<Transaction> _toTransactions(List<dynamic> decodedJson) {
    return decodedJson.map<Transaction>((element) => Transaction.fromJson(element)).toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(Transaction.toJson(transaction));

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-Type':  'application/json',
          'password': '2000'
        },
        body: transactionJson
    );

    Map<String, dynamic> json = jsonDecode(response.body);
    Map<String, dynamic> contactJson = json['contact'];

    return Transaction(json['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        )
    );
  }
}