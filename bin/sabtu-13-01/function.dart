import '../Jumat-12-01/ListData.dart';

int timesTwo(int x) {
  return x * 2;
}

// arrow
int timesSix(int x) => timesTwo(x * 6);
//High Order Function
int runTwice(int x, int I, int Function(int) f) {
  for (var i = 0; i < I; i++) {
    x = f(x);
  }
  return x;
}

void main() {
  print(factorial(10));
  print(rekurfsifFunction(10));
  print(runTwice(6, 8, timesTwo));
  // saat dipanggil parameter nya harus di panggil juga salah satu atau kedua-duanya
  name(firstName: "Makaroni");
  name2(angka1: 9, angka2: 2);

  print(filterName("Anjing", filterBadWord));

  //menggunakan anonymous function
  print(filterName(
      "Nide", (name) => name == "Haidar" ? "Kamu jahat banget" : "Apasih"));

  List<int> data = [1, 2, 3, 4, 5, 6, 3, 2, 4, 4, 5];
  print(sumArray(data));

  var result1 = lowerFunction("numenide");
  print(result1);
}

//named parameter
void name(
        {String? firstName,
        String? lastaName = "alkontole" /*Default Value*/}) =>
    print("My name is $firstName $lastaName");

//required parameter
void name2({required int? angka1, int? angka2}) {
  print("Angka 1 = $angka1\n"
      "Angka 2 = $angka2");
}

//return int function
int sumArray(List<int> data) {
  var total = 0;
  for (var value in data) {
    total += value;
  }
  return total;
}

//HIGHER ORDER FUNCTION
String filterName(String name, String Function(String) filter) {
  var filteredName = filter(name);
  return filteredName;
}

String filterBadWord(String name) => name == "Anjing" ? "*****" : name;

//ANONYMOUS FUNCTION
var lowerFunction = (String name) {
  return name.toUpperCase();
};

//rekursif

//Menggunakan looping
int factorial(int number) {
  int result = 1;
  for (var i = 1; i <= number; i++) {
    result *= i;
  }
  return result;
}

//Menggunakan rekursif function
int rekurfsifFunction(int angka) =>
    angka == 1 ? 1 : angka * rekurfsifFunction(angka - 1);
