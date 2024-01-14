void main() {
  String? guest;
  var guestName = guest ?? "Guest";
  guest = "nide";
  print(guestName);


  int? number;
  number = 2;
  double? dataDouble = number.toDouble();

  print(dataDouble);
}