import 'dart:io';

void main() {
  var listMenu = "Silahkan pilih Menu\n"
      "1. Makanan\n"
      "2. Minuman\n";
  print(listMenu);
  stdout.write("Pilihan Anda: ");
  print(menuMakanan());
}

dynamic menuMakanan() {
  var choice = num.parse(stdin.readLineSync()!);
  if (choice == 1) {
    var makanan = "Pilih Makanan anda!\n"
        "1. Nasi Padang, Rp.15.000\n"
        "2. Soto Ayam, Rp.16.000";
    print(makanan);
    stdout.write("Pilihan Makanan Anda: ");
    var choice1 = num.parse(stdin.readLineSync()!);
    if (choice1 == 1) {
      stdout.write("Berapa porsi? : ");
      var makanan1 = num.parse(stdin.readLineSync()!);
      print("Anda membeli Nasi Padang sebanyak $makanan1 porsi");
      return menuMinuman("Nasi Padang", 15000, makanan1 );
    } else if (choice1 == 2) {
      stdout.write("Berapa porsi? : ");
      var makanan2 = num.parse(stdin.readLineSync()!);
      print("Anda membeli Soto Ayam sebanyak $makanan2 porsi");
      return menuMinuman("Soto Ayam", 16000, makanan2 );
    } else {
      print("Menu tidak tersedia");
      return menuMakanan();
    }
  } else if (choice == 2) {
    return menuMinuman('', '', '');
  } else {
    print("Pilihan Anda tidak terdaftar!, Silahkan pilih ulang!");
    return menuMakanan();
  }
}

dynamic menuMinuman(dynamic choice, dynamic harga, dynamic porsi) {
  var dataMakanan = [choice, harga, porsi];
  stdout.write("Ingin beli minuman?\n"
      "1. YA\n"
      "2. TIDAK\n"
      "Pilihan Anda: ");
  var pilihan = num.parse(stdin.readLineSync()!);
  if (pilihan == 1) {
    var minuman = "Silahkan pilih minuman anda!\n"
        "1. Es Teh Manis, Rp.5000\n"
        "2. Jus Apel, Rp.12.000\n"
        "3. Air Mineral, Rp.3000";
    print(minuman);
    stdout.write("Pilihan Minuman Anda: ");
    var choice2 = num.parse(stdin.readLineSync()!);
    if (choice2 == 1) {
      print("Anda membeli Es Teh Manis");
      return cekBill(dataMakanan, "Es Teh Manis", 5000);
    } else if (choice2 == 2) {
      print("Anda membeli Jus Apel");
      return cekBill(dataMakanan, "Jus Apel", 12000);
    } else if (choice2 == 3) {
      print("Anda membeli Air Mineral");
      return cekBill(dataMakanan, "Air Mineral", 3000);
    } else {
      return "Menu tidak tersedia";
    }
  } else if (pilihan == 2) {
    return cekBill(null, null, null);
  }
  else {
    return "Pilihan Anda tidak terdaftar!";
  }
}

dynamic cekBill(dynamic data, dynamic minuman, dynamic harga) {
  var finalData = [...data, minuman, harga];
  var dataObjek = {
    "makanan": finalData[0],
    "hargaMakanan": finalData[1],
    "porsi": finalData[2],
    "minuman": finalData[3],
    "hargaMinuman": finalData[4]
  };

  return "\n"
      "BILLS\n"
      "Makanan: ${dataObjek['makanan']}\n"
      "Minuman: ${dataObjek['minuman']}\n";

}