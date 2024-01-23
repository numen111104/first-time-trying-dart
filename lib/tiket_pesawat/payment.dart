class PaymentDetails {
  String cardType;
  String name;
  String cardNumber;
  String expiryDate;
  String cvv;
  String email;

  PaymentDetails({
    required this.cardType,
    required this.name,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.email,
  });

  String details() {
    return '>> Card Type: $cardType\n>> Name: $name\n>> Card Number: $cardNumber\n>> Expiry Date: $expiryDate\n>> CVV: $cvv\n>> Email: $email';
  }
}