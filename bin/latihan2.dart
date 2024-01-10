void main () {
  var foo = const [''];
  final zoo = const [''];
  const bar = [];

  foo = ['1,2,3,4'];
  // zoo = ['makan ayam']; tidak bisa deklarasi ulang
  // bar juga sama

  int? integral;
  num? numType;
  double? doble = integral?.toDouble();

  integral = 9;
  numType = 10; //bisa integral bisa double atau float
  print(doble);

  Object makanan = {"Sate Bakar", integral, numType, doble};
  print(makanan);

}