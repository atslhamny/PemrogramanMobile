void main(){
  // 1. Program untuk menyimpan daftar nama mahasiswa menggunakan Growable List
  print("1. DAFTAR NAMA MAHASISWA (Growable List):");
  List<String> namaMahasiswa = [];

  // Menambahkan nama mahasiswa
  namaMahasiswa.add("Atsilah 123");
  namaMahasiswa.add("Jamikatul ipah");
  namaMahasiswa.add("Cindy gajelas");
  namaMahasiswa.add("Boss lia");
  namaMahasiswa.add("Atal 123");

  print("Daftar nama mahasiswa:");
  for (int i = 0; i < namaMahasiswa.length; i++) {
    print("${i + 1}. ${namaMahasiswa[i]}");
  }
  print("Total mahasiswa: ${namaMahasiswa.length}\n");
}