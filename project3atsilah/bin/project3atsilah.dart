import 'dart:io';

import 'package:project3atsilah/project3atsilah.dart' as project3atsilah;

void main(List<String> arguments) {
  print('Hello world: ${project3atsilah.calculate()}!');

var fl = List<int>.filled(4,12);
  fl[0] = 10;
  fl[1] = 20;
  fl[2] = 30;
  fl[3] = 40;
  // fl[4] = 50;

  //Cetak List
  stdout.writeln(fl);

  
}
