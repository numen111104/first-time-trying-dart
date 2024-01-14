void main() {
  Map<int, String> map1 = {1 : "nide", 2 : "haidar", 3 : "misbah"};
  
  List<Map<int,String>> listMap = [
    {1:"Makanan"}, //index 0
    {2:"Minuman"}, //index 1
    {3:"Desert"}, //index 2
    {4:"Topping"} //index 3
  ];

  var cara2 =  [{false : true},{"malan" : "malan"}];
  
  Symbol simbol1 = Symbol("Eko");
  var simbol2 = #belajar;

  // ada 2 cara mendeklarasikan simbol, pake # atau Symbol

  
  print(listMap[0][1]);


  var map2 = {
    4 : 'nasyar',
    5 : 'miqdad',
    6 : 'munir'
  };

  map2[7] = "setan";
  var map3 = <num, dynamic>{
    1: 'w'
  };

  print('map3: $map3 \n'
      'map2: $map2 \n'
      'map1: $map1');
}