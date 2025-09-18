import 'dart:io';

import 'package:project1atsilah/project1atsilah.dart' as project1atsilah;

const String nama = "atsilah"; // compile time constant

void main(List<String> arguments) {
  // print('Hello world: ${project1atsilah.calculate()}!');
  //  satu line comment
  /*
  multi line comment
  banyak line
  */
  // constanta dan final
  final String nama2 = "amany"; // run time constant  
  print("Nama saya $nama $nama2");

  // varianbel
  int umur = 20;
  double tinggi = 160;
  String alamat = "jl. simpang remujung";
  bool jomblo = true;
  bool jenisKelamin = false; // false = perempuan, true = laki-laki
  stdout.writeln("umur saya $umur tahun");
  stdout.writeln("tinggi saya $tinggi cm");
  stdout.writeln("alamat saya di $alamat");
  stdout.writeln("apakah saya jomblo? $jomblo");
  stdout.writeln("Jenis kelamin saya ${jenisKelamin ? 'laki-laki' : 'perempuan'}");
  // if (jenisKelamin == true) {
  //   stdout.writeln("Jenis kelamin saya laki-laki");
  // } else {
  //   stdout.writeln("Jenis kelamin saya perempuan");
  // } 
}
