void main() {
  try {
    int a, b;
    num c;
    a = 10;
    b = 0;
    c = a ~/ b;
    print(c);
  } catch (e, s) {
    print("Terjadi Kesalahan: $e");
    print("Cek Stack: $s");
  } finally {
    print('baris ini tetap akan dijalankan apapun hasil dari try catch');
  }
}
