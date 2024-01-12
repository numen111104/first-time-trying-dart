void main() {
  var inputString = '1000';
  //String to number
  var stringInt = int.parse(inputString);
  var stringDouble = double.parse(inputString);
//number to int / int to number
  var intToDoub = stringInt.toDouble();
  var doubToInt = stringDouble.toInt();

  print(toMinus(93.8));
  print(maghrib(1,2.1));

  dynamic c;
  c = 100;
  var paksaString = c as int;
  print(paksaString);


}

num toMinus(num a) {
  return a != -a ? -a : a;
}


//penggunaan is, as

 maghrib(dynamic a, b) {
      var result = a + b is int ? "integer" : "not integer";
      print(result);
}

