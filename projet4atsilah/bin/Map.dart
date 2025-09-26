void main(){
  // 3. Gunakan Map untuk menyimpan data barang (kode, nama, harga)
  print("3. DATA BARANG MENGGUNAKAN MAP:");
  Map<String, Map<String, dynamic>> dataBarang = {
    "B001": {"nama": "Laptop ASUS", "harga": 7500000},
    "B002": {"nama": "Mouse Wireless", "harga": 150000},
    "B003": {"nama": "Keyboard Mechanical", "harga": 800000},
  };

  print("Daftar barang:");
  dataBarang.forEach((kode, data) {
    print("Kode: $kode");
    print("  Nama: ${data['nama']}");
    print("  Harga: Rp ${data['harga']}");
    print("");
  });

  // Menampilkan minimal 3 barang
  print("Detail 3 barang pertama:");
  int count = 0;
  for (var entry in dataBarang.entries) {
    if (count < 3) {
      print(
        "${count + 1}. ${entry.value['nama']} (${entry.key}) - Rp ${entry.value['harga']}",
      );
      count++;
    }
  }
  print("");
}