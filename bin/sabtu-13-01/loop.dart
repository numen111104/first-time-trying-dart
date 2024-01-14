import 'dart:io';

void main() {
  // LOOPING TIADA HENTI
  /* for(;;) {
    print('Nide Gantenk');
  }
    */

  //Normal for looping
  for (var i = 0; i < 10; i++) {
    print("${i + 1} Nide Gantenk");
  }

  //Do while; eksekusi kode di dalam baris do dijalankan terlebih
  // dahulu kemudian mengecek kondisi perulangan
  var i = 2;
  do {
    print("Kode dieksekusi terlebih dahulu");
    i++;
  } while (i < 10);

  i = 1;
  while (i < 10) {
    print("Kode dieksekusi setelah syarat terpenuhi");
    i++;
  }

  //BREAK DAN CONTINUE

//BREAK
  for (int i = 0; i < 5; i++) {
    print(i);
    if (i == 2) {
      break; // terminate the loop when i equals 2
    }
  }
  //CONTINUE
  for (int i = 0; i < 5; i++) {
    if (i == 2) {
      continue; // skip the rest of the loop body when i equals 2
    }
    print(i);
  }


  //SHORT LOOP
  List<String> array = ["Marco", "Mirko", "Nduts", "Nide"];
  for(var value in array) {
    print(value);
  }
  var listMap = <Map<int, String>>[{
    1: "nide",
    2: "makan"
  }];

  for(var key in listMap.key) {
    print(key);
  }
}
