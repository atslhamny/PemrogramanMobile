void main(){
  // 2. Program untuk menghitung union & intersection dari dua set
  print("2. UNION & INTERSECTION DARI DUA SET:");
  Set<String> set1 = {"Apel", "Jeruk", "Mangga", "Pisang", "Anggur"};
  Set<String> set2 = {"Mangga", "Pisang", "Semangka", "Melon", "Durian"};

  print("Set 1: $set1");
  print("Set 2: $set2");

  // Union (gabungan)
  Set<String> unionSet = set1.union(set2);
  print("Union (Gabungan): $unionSet");

  // Intersection (irisan)
  Set<String> intersectionSet = set1.intersection(set2);
  print("Intersection (Irisan): $intersectionSet\n");

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