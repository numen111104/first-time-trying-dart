class Person {
  late int umur;
  late String name;
  late String address;
}

void main() {
  var person = Person();

  person.address = "Maluku Utara";
  person.umur = 17;
  person.name = "Numenide";

  var name = person.name;

  print(
      "Seorang anak berumur ${person.umur} mencoba melarikan diri dari ${person.address}"
      " bernama $name");

  var firstName = 'Nide';
  final String? lastName;
  firstName = "Payao"; //bisa deklarasi ulang nilai nya
  lastName = "Neimar"; //deklarasi pertama untuk final keyword
  print("Nama depan: $firstName, & nama belakang $lastName");
  //lastName = "JR"; //deklarasi kedua menyebabkan error karena menggunakan final
  // final = keyword variabel untuk mendeny deklarasi ulang nama variabel
  // const = keyword variabel untuk mendeny deklatasi ulang value dari variabel
  /*


  perbedaan
  final array1 = [0,1,2];
  const array2 = [0,1,2];


ketik melakukan deklarasi
  array1[0] = 10; //bisa diubah
  array2[0] = 10; //tidak bisa diubah
   */

  firstName = 'Haidar';

  final array1 = [0,1,2];
  const array2 = [0,1,2];

  array1[0] = 10; //bisa diubah
  // array2[0] = 10; //tidak bisa diubah

  print(array1);
  print(array2);

  var value = getValue();
  print('variabel yang dibuat');
  print(value);

  late String? value2 = getName();
  print("Desc 1");
  print(value2);
}

String getValue() {
  print("Fungsi dipanggil");
  return "Numenide\n";
}

getName() {
  print("Fungsi getName() called");
  return "desc3\n";
}