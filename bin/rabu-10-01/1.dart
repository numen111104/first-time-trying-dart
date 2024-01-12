void main() {
  String firstName;
  String lastName;
  firstName = "Numenide";
  lastName = "Nasyar";
  var nama = firstName + lastName;
  var nama2 = "Numenide" "Nasyar";
  assert(nama == nama2);
  assert(playerName(null)==playerHost(null));

}

String playerName(String? name) => name ?? 'guest';
String playerHost(String? name){
  return name ?? 'guest';
}