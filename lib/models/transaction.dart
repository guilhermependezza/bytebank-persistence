import 'contact.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction(
      this.value,
      this.contact,
      );

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }

  static Transaction fromJson(Map<String, dynamic> transactionJson) {
    return Transaction(
        transactionJson['value'],
        Contact.fromJson(transactionJson['contact'])
    );
  }

  static Map<String, dynamic> toJson(Transaction transaction) {
    return {
      "value": transaction.value,
      "contact": Contact.toJson(transaction.contact)
    };
  }
}
