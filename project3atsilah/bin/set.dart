import 'dart:io';

void main(List<String> arguments) {
  var setnilai1 = <String>{};
  // var setnilai2 = <int>{1, 2, 3};
  stdout.writeln("Masukkan Jumlah Nilai: ");
  String? input = stdin.readLineSync();
  int jumlah1 = int.tryParse(input ?? '') ?? 0;
  for (var i = 0; i < jumlah1; i++) {
    stdout.writeln("Masukkan Nilai ke-${i + 1}: ");
    String? inputnilai = stdin.readLineSync();
    String nilai = inputnilai ?? '';
    setnilai1.add(nilai);
  }

  var nilaitolist = setnilai1.toList();
  print(nilaitolist.elementAt(0));
  // print(setnilai1.union(setnilai2));
  // print(setnilai1.intersection(setnilai2));
}