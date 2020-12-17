import 'dart:convert';

import 'package:bytebank_persistence/models/contact.dart';
import 'package:bytebank_persistence/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

Future<List<Transaction>> findAll() async {
  Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client.get('http://192.168.15.5:8080/transactions');
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactionList = List();

  for(Map<String, dynamic> element in decodedJson) {
    final Transaction transaction = Transaction(
      element['value'],
      Contact(0, element['contact']['name'], element['contact']['accountNumber'])
    );

    transactionList.add(transaction);
  }

  return transactionList;
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('status code: ${data.statusCode}');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

}