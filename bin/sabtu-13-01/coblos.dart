import 'dart:io';

void main() {
  nyoblos2023();
}

dynamic nyoblos2023() {
  List<Map<int, String>> capresNames = [
    {1: "Ganjar & Mahfud"},
    {2: "Prabowo & Gibran"},
    {3: "Anies & Amien"}
  ];
  print("Siapa Capres yang anda pilih dibawah ini?");
  for (var i = 0; i < capresNames.length; i++) {
    print("${i+1}. ${capresNames[i][i+1]}");
  }
  stdout.write("Pilihan anda: ");
  var choice = stdin.readLineSync();
    if (choice == '1') {
      ganjarChoice();
    } else if (choice == '2') {
      prabowoChoice();
    } else if (choice == '3') {
      aniesChoice();
    } else {
      print("Anda memilih yang tidak ada, silahkan pilih kembali");
      nyoblos2023();
    }
}

aniesChoice() {
  print( "ANDA BERHASIL NYOBLOS ANIES");
  // TODO: TAMBAHKAN HASIL LAINNYA JIKA ANIES TERCOBLOS
}

prabowoChoice(){
  print("ANDA BERHASIL NYOBLOS PRABOWO");
  // TODO: TAMBAHKAN HASIL LAINNYA JIKA PRABOWO TERCOBLOS
}

ganjarChoice() {
  print("ANDA BERHASIL NYOBLOS GANJAR");
  //TODO: TAMBAHKAN HASIL LAINNYA JIKA GANJAR TERCOBLOS
}