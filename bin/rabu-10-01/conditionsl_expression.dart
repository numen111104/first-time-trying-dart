import 'dart:io';
import 'dart:math';

void main() {
  // Notasi Cascade
  final mycar = (Car(
    brand: "Honda",
    model: "Civic",
    year: 2022,
    gift: Gift(),
  )..displayInfoCar());

  print(mycar.displayInfoCar());

}


class Car {
  String brand;
  String model;
  int year;
  Gift gift;

  Car({
    required this.brand,
    required this.model,
    required this.year,
    required this.gift,
  });

  dynamic displayInfoCar() async {
    if (brand == 'Honda') {
      print("Selamat Anda orang beruntung!\n"
          "Anda akan mendapatkan tambahan Hadiaah!\n");
      String code =  await gift.generateUniqueCode();
      print("Kode Unik anda adalah: $code");
      return gift.winnerGift(code);
    } else {
      print("Maaf merek mobil anda adalah $brand\n"
          "yang dapat mengikuti giftaway ini hanyalah mobil HONDA\n\n");
      return "THANKS";
    }
  }
}

class Gift {
  dynamic winnerGift(String code) {
    String info1 = "Anda akan mendapatkan Emas dan Perak\n"
        "Masukkan kode hadiah anda:";
    stdout.write(info1);
    String choice = stdin.readLineSync()!;
    if (choice == code) {
      return "Ini emas untuk anda";
    } else {
      print("Anda salah memasukkan kode!");
      return winnerGift(code);
    }
  }

  Future<dynamic> generateUniqueCode() async {
    DateTime now = DateTime.now();
    int randomCode = Random().nextInt(99999);
    String uniqueCode = "${now.microsecondsSinceEpoch}$randomCode";
    return uniqueCode.substring(0, 5);
  }
}
