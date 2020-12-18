class Contact {
  final int id;
  final String name;
  final int accountNumber;

  Contact(this.id, this.name, this.accountNumber);

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accountNumber: $accountNumber}';
  }

  static Contact fromJson(Map<String, dynamic> contactJson) {
    return Contact(0, contactJson['name'], contactJson['accountNumber']);
  }

  static Map<String, dynamic> toJson(Contact contact) {
    return {
      "name": contact.name,
      "accountNumber": contact.accountNumber
    };
  }
}
