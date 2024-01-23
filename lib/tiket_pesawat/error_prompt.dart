import 'symbols.dart' as symbols;

String yesNoOnly() {
  return '${symbols.warning()} Please enter y or n only ${symbols.warning()}';
}

String numericOnly() {
  return '${symbols.error()} Please enter a valid numeric value ${symbols.error()}';
}

String notFound(String data) {
  return '${symbols.notFound()} $data not found ${symbols.notFound()}';
}

String cancel() {
  return '\nOkay, thank you for using AirTix. See you on your next flight!';
}

String notEmpty() {
  return '${symbols.error()} Please enter a value ${symbols.error()}';
}

String minLength(int length) {
  return '${symbols.error()} Please enter at least $length characters ${symbols.error()}';
}

String validEmail() {
  return '${symbols.error()} Please enter a valid email address ${symbols.error()}';
}