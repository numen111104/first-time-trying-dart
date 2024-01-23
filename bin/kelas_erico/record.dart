void main(List<String> args) {
  //cara mendeklarasikan record
  (int personId, String addres, {String name, int age}) typeRecord =
      (1, "tidore", name: "nide", age: 17);
  //(1, age: 18, "karawang", name: "haidar"); yang atas versi aturan, ini acak
// bersifat immutable, data yang bertipe record tidak bisa diperbarui
  //record value semantik
  print(typeRecord.name);
  print(typeRecord.age);
  print(typeRecord.$1);
  print(typeRecord.$2);

  ({int width, int height}) rect = (height: 2, width: 2);
  //fungsi yang dapat menerima parameter Record
  print(rectangleArea(rect));
  print(rectangleArea((height: 8, width: 9)));

  //fungsi yang bertipe data record
  ({int area, int circumference}) result = rectangleAreaCircumference(rect);
  print(result.area);
  print(result.circumference);

  //record

}

//fungsi yang menerima parameter record
int rectangleArea(({int width, int height}) args) {
  return args.width * args.height;
}

//fungsi yang mengembalikan tipe record dan parameter record
({int area, int circumference}) rectangleAreaCircumference(
    ({int width, int height}) rectangle) {
  return (
    area: rectangle.width * rectangle.height,
    circumference: 2 * (rectangle.width + rectangle.height)
  );
}
