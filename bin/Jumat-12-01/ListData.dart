Future<void> main() async {
  final List<String> arrayDart = ["Angka1"];

  arrayDart.add("Makanan");
  print(arrayDart);
  String a = arrayDart[0];
  print(a.substring(1, 2));
  addingArrayList(20);
  setType();

}

// TODO: Buatlah sebuah fungsi yang memasukkan angka ganjil 1-20 ke dalam empty list

dynamic addingArrayList(int angka) {
  var ganjilArray = <int>[];
  var genapArray = <int>[];
  for (var i = 0; i < angka; i++) {
    if (i % 2 != 0) {
      print("ganjil: $i");
      ganjilArray.add(i);
    } else {
      print("genap: $i");
      genapArray.add(i);
    }
  }
  print("List array ganjil = $ganjilArray\n"
      "List array genap = $genapArray");
   delTwoIndex(ganjilArray, genapArray);
}

void delTwoIndex(List<int> arrayGanjil, List<int> arrayGenap) {
  var finalGanjil = <int>[];
  var finalGenap = <int>[];
 for(var i = 0; i < arrayGanjil.length; i++) {
   finalGanjil.add(arrayGanjil.removeAt(i));
 }
 for(var i = 0; i < arrayGenap.length; i++) {
   finalGenap.add(arrayGenap.removeAt(i));
 }

  print('List setelah dihapus 2 index genap: $finalGenap');
 print('List setelah dihapus 2 index ganjil: $finalGanjil');
}

// Set digunakan untuk menyimpan nilai unik, artinya tidak duplikat
void setType() {
  var persons = <String>{};
  persons = {
    "nide",
    "manumane",
    "nide", // Tidak boleh duplikat
    "numen",
  };
  print(persons);
}