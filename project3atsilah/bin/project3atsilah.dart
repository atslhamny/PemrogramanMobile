import 'dart:io';

import 'package:project3atsilah/project3atsilah.dart' as project3atsilah;

void main(List<String> arguments) {
//   // print('Hello world: ${project3atsilah.calculate()}!');
// fixed list
// var fl = List<int>.filled(4,12);
//   fl[0] = 10;
//   fl[1] = 20;
//   fl[2] = 30;
//   fl[3] = 40;
//   fl[4] = 50;

//   Cetak List
//   stdout.writeln(fl);
// growable list
// var grow = [1, 2, 3, 4];
//   grow.add(5);
//   grow.remove(2);

//   Cetak List
//   stdout.writeln(grow);

// set
var setnilai = <int>{1, 2, 3, 4};
var setnilai2 = <int>{3, 3, 4, 5};

print(setnilai2);
print(setnilai.union(setnilai2));
print(setnilai.intersection(setnilai2));



}
