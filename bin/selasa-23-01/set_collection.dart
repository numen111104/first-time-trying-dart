void main () {
  Set diagram1 = {1,2,3,4};
  Set diagram2 = {8,2,3,9,4};
    // union func = sebagai gabungan diantara 2 diagram
  var union = diagram1.union(diagram2);
  print('Gabungan dari $diagram1 & $diagram2 adalah: $union');
  // intersection func =sebagai irisan antara 2 diagram
  var intersection = diagram1.intersection(diagram2);
  print('Irisan dari $diagram1 & $diagram2 adalah: $intersection');
}