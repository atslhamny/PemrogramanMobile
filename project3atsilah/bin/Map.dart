import 'dart:io';

void main(List<String> arguments) {
  var sudah = {'nim': '10', 'nama': 'atsilah', 'alamat': 'jl. simpang remujung'};
  print(sudah);
  print(sudah['nama']);

  var opo = {
    'nim': ["101", "102"],
    'nama': ["andika", "atsilah"],
    'umur': [20, 21],
  };

  print(opo);
  print(opo['nama']);
  print(opo['nama']![1]); // digunakan sesuai index yang dipilih
} 