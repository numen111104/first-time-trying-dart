import 'dart:convert';
import 'dart:io';
import 'dart:math';

bool checkBool(bool? args) => args != null ? true : false;
String checkName(String? name) => name ?? "Nide";
// ?? menugaskan nilai default jika parameter null
// kondisi ? true : false
void main() {
  print(checkBool(false));
  print(checkName(null));

//Notasi Cascade
/*  final mobil = CarBuilder()
    ..brand = 'BMW'
    ..model = "Porsche"
    ..year = 2032
  ..engine= ;

  print(mobil.brand);
 */
}

class Car {
  String brand;
  String model;
  int year;
  Gift gift;

  Car(this.brand, this.model, this.year, this.gift);

  dynamic displayInfoCar() async {
    if(brand == 'Honda') {

      print("Selamat Anda orang beruntung!\n"
          "Anda akan mendapatkan tambahan Hadiaah!\n");
      String code = await gift.generCodeUniq();
      print("Kode Unik anda adalah: $code");
      return gift.winnerGift(code);
    } else {
      print("Maaf merek mobil anda adalah $brand\n"
          "yang dapat mengikuti giftaway ini hanyalah mobil HONDA");
      // TODO
    }
  }
}

class Gift{
  Car car;
  Gift(this.car);

  dynamic winnerGift( String code ){
    String info1 = "Anda akan mendapatkan Emas dan Perak\n"
        "Masukkan kode hadiah anda:";
    stdout.write(info1);
    String choice = stdin.readLineSync()!;
    if(choice == code) {
      return "Ini emas untuk anda";
    } else {
      return "Anda salah memasukkan kode!";
      //TODO balikkan fungsi pertanyaan ini
    }

  }

  dynamic generCodeUniq() {
    DateTime now = DateTime.now();
    int randomCode = Random().nextInt(99999);
    String uniqueCode = "${now.microsecondsSinceEpoch}$randomCode";
    return uniqueCode.substring(0, 5);
  }
}
