// dynamic adalah penginsiasi variabel yang tipe datanya bebas, bisa apa saja
void main() {
  print(unaryPost(10));
  print(unaryPrefix(10));
  print(multiplicative(1, 9));

  print(campuran(multiplicative(1, 3), unaryPost(100), unaryPrefix(20)));
  print(mixed(23));

  assert(3 / 2 != 2);
  assert(2 - 2 == 0);

  var a = 10;
  var b = a++;
  assert(a != b);

  print(factorial(5));
}

dynamic unaryPost(angka) {
  return ++angka;
}

dynamic unaryPrefix(angka) {
  return --angka;
}

dynamic multiplicative(a, b) {
  return a * b;
}

dynamic campuran(arg1, arg2, arg3) {
  if ((arg1 + arg3) ~/ (arg3 - arg2) is double) {
    return (unaryPost(arg1) - multiplicative(arg1, arg2)) * arg3;
  }
  return multiplicative(arg3, arg1) % 2;
}

dynamic mixed(arg) {
  if (arg is double) {
    return "You input the boolean type";
  } else if (arg is int) {
    return "You input the integral type";
  } else if (arg is String) {
    return "You input the string type";
  } else {
    return "You input the dynamic type";
  }
}

int factorial(arg) {
  if (arg == 0 || arg == 1) {
    return 1;
  }
  return arg * factorial(arg - 1);
}
