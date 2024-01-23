import 'dart:io';
import 'package:first_projek/tiket_pesawat/symbols.dart' as symbols;
import 'package:first_projek/tiket_pesawat/destination.dart' as destinations;
import 'package:first_projek/tiket_pesawat/custom_date.dart' as custom_date;
import 'package:first_projek/tiket_pesawat/error_prompt.dart' as error_prompt;
import 'package:first_projek/tiket_pesawat/airlines.dart' as airlines;
import 'package:first_projek/tiket_pesawat/services.dart' as services;
import 'package:first_projek/tiket_pesawat/payment.dart';

List<dynamic>? destination;
List<dynamic>? departure;
DateTime? departureDate;
List<dynamic>? airline;
List<List<dynamic>>? passenger;
bool? confirmedBooking;
int? airlinePrice;
int? totalPrice;

void main(List<String> arguments) {
  print(
      '${symbols.airplane()} Welcome to AirTix! ${symbols.airplane()} \n${symbols.star()} The best flight ticket service in the world ${symbols.star()}');

  String? isProceed;
  do {
    stdout.write('\nWould you like to book a flight? (y/n) ');
    isProceed = stdin.readLineSync();

    if (isProceed == 'y') {
      print('\nGreat! Here are the types of flights:');
      print('1. Domestic\n2. International');
      bookFlight();
      if (confirmedBooking == true) {
        String? isPayment;
        do {
          stdout.write('\nProceed to payment? (y/n) ');
          isPayment = stdin.readLineSync();

          if (isPayment == 'y') {
            payment();
            print(
                '\n${symbols.heart()} Your booking has been confirmed! ${symbols.heart()}');
            showDetails('booking');
            print(
                '\n${symbols.heart()} Thank you for choosing AirTix! ${symbols.heart()}');
          } else if (isPayment == 'n') {
            print(error_prompt.cancel());
          } else {
            print(error_prompt.yesNoOnly());
          }
        } while (isPayment != 'y' && isPayment != 'n');
      }
    } else if (isProceed == 'n') {
      print(error_prompt.cancel());
    } else {
      print(error_prompt.yesNoOnly());
    }
  } while (isProceed != 'y' && isProceed != 'n');
}

void bookFlight() {
  String? flightType;
  do {
    stdout.write('\nChoose your flight type: ');
    flightType = stdin.readLineSync();

    switch (flightType) {
      case '1':
        destination = chooseOption(destinations.domestics(), 'destination');
        departure = chooseOption(
            destinations.domestics() + destinations.internationals(),
            'departure',
            excludeOption: destination);
        break;
      case '2':
        destination =
            chooseOption(destinations.internationals(), 'destination');
        departure = chooseOption(
            destinations.domestics() + destinations.internationals(),
            'departure',
            excludeOption: destination);
        break;
      default:
        print(
            '\n${symbols.warning()} Please enter 1 or 2 only ${symbols.warning()}');
    }
  } while (flightType != '1' && flightType != '2');

  departureDate = chooseDate();

  airline = chooseAirline(airlines.airlines());

  showDetails('flight');

  print('\nAdd Passenger Information');
  String? addMorePassenger;
  do {
    if (passenger == null) {
      passenger = [];
      addMorePassenger = 'y';
    } else {
      stdout.write('\nWould you like to add more passengers? (y/n) ');
      addMorePassenger = stdin.readLineSync();
    }

    if (addMorePassenger == 'y') {
      passenger?.add(addPassenger());
    } else if (addMorePassenger != 'y' && addMorePassenger != 'n') {
      print(error_prompt.yesNoOnly());
    }
  } while (addMorePassenger != 'n');

  print('\n${symbols.star()} SELECT YOUR CLASS ${symbols.star()}');

  classPassanger();

  showDetails('ticket');

  confirmedBooking = confirmBooking();
}

List<dynamic> chooseOption(List<List<dynamic>> options, String type,
    {List<dynamic>? excludeOption}) {
  print('\nHere are the $type options available:');
  for (var i = 0; i < options.length; i++) {
    if (excludeOption != null && excludeOption.contains(options[i][0])) {
      continue;
    }
    print('${i + 1}. ${options[i][0]}');
  }

  int? index;
  do {
    stdout.write('\nChoose your $type: ');
    try {
      index = int.parse(stdin.readLineSync()!) - 1;

      if (index >= 0 && index < options.length) {
        if (excludeOption != null &&
            excludeOption.contains(options[index][0])) {
          print(error_prompt.notFound(type));
          index = null;
        } else if (excludeOption == null ||
            !excludeOption.contains(options[index][0])) {
          print('\n${options[index][0]} is now your $type!');
          return options[index];
        }
      } else {
        print(error_prompt.notFound(type));
      }
    } on Exception {
      print(error_prompt.numericOnly());
    }
  } while (index == null || index < 0 || index >= options.length);

  return [];
}

DateTime chooseDate() {
  print('\nHere are the departure dates available:');
  for (var i = 0; i < 7; i++) {
    DateTime dateCollection = DateTime.now().add(Duration(days: i + 1));
    print(
        '${i + 1}. ${custom_date.day(dateCollection)}, ${dateCollection.day} ${custom_date.month(dateCollection)} ${dateCollection.year}');
  }

  int? index;
  do {
    stdout.write('\nChoose your departure date: ');
    try {
      index = int.parse(stdin.readLineSync()!) - 1;

      if (index >= 0 && index < 7) {
        DateTime chosenDate = DateTime.now().add(Duration(days: index + 1));
        print(
            '\n${custom_date.day(chosenDate)}, ${chosenDate.day} ${custom_date.month(chosenDate)} ${chosenDate.year} is set as your departure date!');
        return chosenDate;
      } else {
        print(error_prompt.notFound('Departure date'));
      }
    } on Exception {
      print(error_prompt.numericOnly());
    }
  } while (index == null || index < 0 || index >= 7);

  return DateTime.now();
}

List<dynamic> chooseAirline(List<List<dynamic>> options) {
  print('\nHere are the airlines available:');
  for (var i = 0; i < options.length; i++) {
    print('${i + 1}. ${options[i][0]}');
  }

  int? index;
  do {
    stdout.write('\nChoose your airline: ');
    try {
      index = int.parse(stdin.readLineSync()!) - 1;

      if (index >= 0 && index < options.length) {
        print('\n${options[index][0]} is now your airline!');
        return options[index];
      } else {
        print(error_prompt.notFound('Airline'));
      }
    } on Exception {
      print(error_prompt.numericOnly());
    }
  } while (index == null || index < 0 || index >= options.length);
  return [];
}

List<dynamic> addPassenger() {
  stdout.write('\nEnter Passenger Name? ');
  String name = stdin.readLineSync()!;
  int? age;
  do {
    try {
      stdout.write('Enter Passenger Age? ');
      age = int.parse(stdin.readLineSync()!);
    } on Exception {
      print(error_prompt.numericOnly());
      age = null;
    }
  } while (age == null);
  String? nullClass;
  return [name, age, nullClass];
}

void classPassanger() {
  passenger?.forEach((element) {
    print(
        '\nPassenger ${passenger!.indexOf(element) + 1} : ${element[0]} - ${element[1]} years old');
    print('${symbols.rightArrow()} Class Type: ');
    for (var i = 0; i < services.classes.length; i++) {
      print('${i + 1}. ${services.classes[i]}');
    }

    String? classType;
    do {
      stdout.write('\nChoose your class type: ');
      classType = stdin.readLineSync();

      switch (classType) {
        case '1':
          element[2] = services.classes[0];
          break;
        case '2':
          element[2] = services.classes[1];
          break;
        case '3':
          element[2] = services.classes[2];
          break;
        default:
          print(
              '\n${symbols.warning()} Please enter 1, 2 or 3 only ${symbols.warning()}');
      }
    } while (classType != '1' && classType != '2' && classType != '3');
  });
}

double calculateBooking() {
  double distanceModifier = (destination![1] - departure![1]).abs();
  airlinePrice = (airline![1] * distanceModifier).round();
  double passengerPrice = 0;

  passenger?.forEach((element) {
    passengerPrice += (airlinePrice! * services.modifiers()[element[2]]!);
  });

  return passengerPrice;
}

void showPassenger(booking) {
  print('\n${symbols.star()} Passengers Details ${symbols.star()}');
  for (var i = 0; i < passenger!.length; i++) {
    print(
        '${i + 1}. ${passenger![i][0]} - ${passenger![i][1]} years old - ${passenger![i][2]} ${booking ? '\t\t ==> x (${services.modifiers()[passenger![i][2]]})  = Rp. ${formatMoney(airlinePrice! * services.modifiers()[passenger![i][2]]!)}' : ''}');
  }
}

void showDetails(String type) {
  print(
      '\n${symbols.airplane()} Here are Your $type details: ${symbols.airplane()}');
  print('Airline: ${airline![0]}');
  print('Departure: ${departure![0]}');
  print('Destination: ${destination![0]}');
  print(
      'Departure Date: ${custom_date.day(departureDate!)}, ${departureDate!.day} ${custom_date.month(departureDate!)} ${departureDate!.year}');

  if (type == 'booking') {
    totalPrice = (calculateBooking()).round();
    print(
        '\nAirline Price : \t\t\t\t Rp. ${formatMoney(airlinePrice!)} / person');
  }

  if (passenger != null) {
    showPassenger(type == 'booking' ? true : false);
    if (type == 'booking') {
      print(
          '\n${symbols.airplane()} Total Price: \t\t\t\t\t Rp. ${formatMoney(totalPrice)}');
    }
  }
}

bool confirmBooking() {
  bool booking = false;
  String? confirmBooking;
  do {
    stdout.write('\nProceed to confirm your booking? (y/n) ');
    confirmBooking = stdin.readLineSync();

    if (confirmBooking == 'y') {
      showDetails('booking');
      booking = true;
    } else if (confirmBooking == 'n') {
      print(error_prompt.cancel());
    } else {
      print(error_prompt.yesNoOnly());
    }
  } while (confirmBooking != 'y' && confirmBooking != 'n');
  return booking;
}

void payment() {
  print('\n${symbols.star()} ENTER YOUR PAYMENT DETAILS ${symbols.star()} ');

  String? cardType = getInput(
      'Choose your card type:\n1. Debit Card\n2. Credit Card\nEnter your choice: ',
      ['1', '2'],
      '1',
      '2');
  String? name = getValidatedInput('Enter Card Holder Name: ',
          (value) => value != null && value.length >= 3, error_prompt.notEmpty());
  String? cardNumber = getValidatedInput('Enter Card Number: ',
          (value) => value != null && value.length >= 16, error_prompt.notEmpty());
  String? expiryDate = getValidatedInput('Enter Expiry Date: (MM/YY) ',
          (value) => value != null && value.length >= 5, error_prompt.notEmpty());
  String? cvv = getValidatedInput('Enter CVV: ',
          (value) => value != null && value.length >= 3, error_prompt.notEmpty());
  String? email = getValidatedInput(
      'Enter Email: ',
          (value) => value != null && value.contains('@'),
      error_prompt.validEmail());

  PaymentDetails paymentDetails = PaymentDetails(
    cardType: (cardType == '1') ? 'Debit Card' : 'Credit Card',
    name: name!,
    cardNumber: cardNumber!,
    expiryDate: expiryDate!,
    cvv: cvv!,
    email: email!,
  );

  print(
      '\n${symbols.star()} PAYMENT DETAILS ${symbols.star()}\n \n${paymentDetails.details()}');
}

String? getInput(
    String prompt, List<String> validOptions, String option1, String option2) {
  String? input;
  do {
    stdout.write(prompt);
    input = stdin.readLineSync();
    if (input != null && !validOptions.contains(input)) {
      print(
          '\n${symbols.warning()} Please enter $option1 or $option2 only ${symbols.warning()}');
    }
  } while (input == null || !validOptions.contains(input));
  return input;
}

String? getValidatedInput(
    String prompt, bool Function(String?) validator, String errorMessage) {
  String? input;
  do {
    stdout.write(prompt);
    input = stdin.readLineSync();
    if (!validator(input)) {
      print(errorMessage);
    }
  } while (!validator(input));
  return input;
}

String formatMoney(data) {
  return data.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}