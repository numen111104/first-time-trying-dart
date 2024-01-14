void main() {
cekNilai(50);
}

cekNilai(int nilai){
  switch(nilai) {
    case 90 || 95 || 80 || 85 :
      print('Anda Lulus dengan predikat yang baik A');
      break;
    case 70 || 75 || 60 || 65:
      print("anda Lulus dengan predikat B");
      break;
    case 50 || 55 || 40:
      print("anda tidak lulus");
      break;
    default:
      print('nilai anda tidak valid, masukkan nilai yang valid');
  }

  var listMap = <Map<int,int>> [
    {1: 10},
    {2: 20}
  ];
  listMap;
}