int timesTwo(int x) {
  return x * 2;
}

// arrow
int timesSix(int x) => timesTwo(x * 6);

int runTwice(int x, int I, int Function(int) f) {
  for (var i = 0; i < I; i++) {
    x = f(x);
  }
  return x;
}

void main() {
  print(runTwice(6, 8, timesTwo));
  // saat dipanggil parameter nya harus di panggil juga salah satu atau kedua-duanya
  name(firstName: "Makaroni");
  name2(angka1: 9, angka2: 2
  );

  List<int> data = [1,2,3,4,5,6,3,2,4,4,5];
  print(sumArray(data));
}

//named parameter
void name({String? firstName, String? lastaName = "alkontole" /*Default Value*/}) =>
    print("My name is $firstName $lastaName");

//required parameter
void name2({required int? angka1, int? angka2}) {
  print("Angka 1 = $angka1\n"
      "Angka 2 = $angka2");
}


//return int function
int sumArray(List<int> data) {
  var total = 0;
  for( var value in data){
    total += value;
  }
  return total;
}
