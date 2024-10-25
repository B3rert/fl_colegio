import 'dart:convert';

class PaymentModel {
  String cardNumber;
  String cvv;
  String expirationDate;
  double amount;
  String destinationAccount;

  PaymentModel({
    required this.cardNumber,
    required this.cvv,
    required this.expirationDate,
    required this.amount,
    required this.destinationAccount,
  });

  factory PaymentModel.fromJson(String str) =>
      PaymentModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromMap(Map<String, dynamic> json) => PaymentModel(
        cardNumber: json["cardNumber"],
        cvv: json["cvv"],
        expirationDate: json["expirationDate"],
        amount: json["amount"]?.toDouble(),
        destinationAccount: json["destinationAccount"],
      );

  Map<String, dynamic> toMap() => {
        "cardNumber": cardNumber,
        "cvv": cvv,
        "expirationDate": expirationDate,
        "amount": amount,
        "destinationAccount": destinationAccount,
      };
}
