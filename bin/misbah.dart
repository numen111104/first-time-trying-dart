import 'dart:io';

void main(List<String> arguments) {
  var diskon = 0.1;
  List<Map<String, dynamic>> makanan = [
    {'nama': 'Nasi Padang', 'harga': 15000},
    {'nama': 'Soto Ayam', 'harga': 11000},
  ];

  List<Map<String, dynamic>> minuman = [
    {'nama': 'Es Teh Manis', 'harga': 5000},
    {'nama': 'Jus Apel', 'harga': 12000},
    {'nama': 'Air Mineral', 'harga': 3000},
  ];

  print('''
Selamat Datang di Restoran Kami!
Pilih List Menu yang ingin di tampilkan
1. Makanan
2. Minuman
''');

  stdout.write('Masukkan Pilihan Anda: ');
  var pilihan = int.parse(stdin.readLineSync()!);

  if (pilihan == 1) {
    print('''
Anda Memilih Menu Makanan
Berikut Menu makanan kami:
    ''');
    for (var i = 0; i < makanan.length; i++) {
      print(
          '${i + 1}. ${makanan[i]['nama']} - Harga: Rp ${makanan[i]['harga']}');
    }
    int pesanan;
    do {
      stdout.write('Masukkan Pesanan Anda: ');
      pesanan = int.parse(stdin.readLineSync()!);
      if (pesanan > makanan.length) {
        print('Menu Pesanan Tidak Tersedia!');
      }
    } while (pesanan > makanan.length);
    stdout.write('Jumlah Porsi untuk ${makanan[pesanan - 1]['nama']} : ');
    var porsi = int.parse(stdin.readLineSync()!);
    var total = makanan[pesanan - 1]['harga'] * porsi;
    print('''
Pesanan Anda: ${makanan[pesanan - 1]['nama']} - $porsi Porsi
Total Harga: Rp $total
''');
    if (total >= 50000) {
      total = (total - (total * diskon)).round();
      print('''
Total Pesanan lebih dari Rp 50000. Anda Mendapatkan Diskon 10%
Total Harga Setelah Diskon: Rp $total
''');
    }
    stdout.write('Jumlah Uang Anda: ');
    var uang = int.parse(stdin.readLineSync()!);
    var kembalian = uang - total;
    if (uang < total) {
      print('Uang Anda Kurang Rp ${kembalian.abs()}');
    } else {
      print('''
Kembalian: Rp $kembalian
Terima Kasih!
''');
    }
  } else if (pilihan == 2) {
    print('''
Anda Memilih Menu Minuman
Berikut Menu minuman kami:
''');
    for (var i = 0; i < minuman.length; i++) {
      print(
          '${i + 1}. ${minuman[i]['nama']} - Harga: Rp ${minuman[i]['harga']}');
    }
    int pesanan;
    do {
      stdout.write('Masukkan Pesanan Anda: ');
      pesanan = int.parse(stdin.readLineSync()!);
      if (pesanan > minuman.length) {
        print('Menu Pesanan Tidak Tersedia!');
      }
    } while (pesanan > minuman.length);
    stdout.write('Jumlah Porsi untuk ${minuman[pesanan - 1]['nama']} : ');
    var porsi = int.parse(stdin.readLineSync()!);
    var total = minuman[pesanan - 1]['harga'] * porsi;
    print('''
Pesanan Anda: ${minuman[pesanan - 1]['nama']} - $porsi Porsi
Total Harga: Rp $total
''');
    if (total >= 50000) {
      total = (total - (total * diskon)).round();
      print('''
Total Pesanan lebih dari Rp 50000. Anda Mendapatkan Diskon 10%
Total Harga Setelah Diskon: Rp $total
''');
    }
    stdout.write('Jumlah Uang Anda: ');
    var uang = int.parse(stdin.readLineSync()!);
    var kembalian = uang - total;
    if (uang < total) {
      print('Uang Anda Kurang Rp ${kembalian.abs()}');
    } else {
      print('''
Kembalian: Rp $kembalian
Terima Kasih!
''');
    }
  } else {
    print('Pilihan tidak tersedia');
  }
}