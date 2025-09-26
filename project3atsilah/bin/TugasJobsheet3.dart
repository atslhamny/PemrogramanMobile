
void main() {
  print("=== TUGAS PRAKTIKUM JOBSHEET 3 ===\n");

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

  // 4. Function closure yang menghitung diskon bertingkat
  print("4. FUNCTION CLOSURE - DISKON BERTINGKAT:");

  // Closure function untuk menghitung diskon
  Function createDiscountCalculator() {
    return (double totalBelanja) {
      double diskon = 0;
      String kategori = "";

      if (totalBelanja >= 1000000) {
        diskon = 0.15; // 15%
        kategori = "Premium (15%)";
      } else if (totalBelanja >= 500000) {
        diskon = 0.10; // 10%
        kategori = "Gold (10%)";
      } else if (totalBelanja >= 100000) {
        diskon = 0.05; // 5%
        kategori = "Silver (5%)";
      } else {
        diskon = 0; // 0%
        kategori = "Regular (0%)";
      }

      double jumlahDiskon = totalBelanja * diskon;
      double totalBayar = totalBelanja - jumlahDiskon;

      return {
        'totalBelanja': totalBelanja,
        'kategori': kategori,
        'persenDiskon': diskon * 100,
        'jumlahDiskon': jumlahDiskon,
        'totalBayar': totalBayar,
      };
    };
  }

  var hitungDiskon = createDiscountCalculator();

  // Test dengan berbagai nominal
  List<double> testNominal = [50000, 150000, 750000, 1200000];

  for (double nominal in testNominal) {
    var hasil = hitungDiskon(nominal);
    print("Total Belanja: Rp ${hasil['totalBelanja']}");
    print("Kategori: ${hasil['kategori']}");
    print("Jumlah Diskon: Rp ${hasil['jumlahDiskon']}");
    print("Total Bayar: Rp ${hasil['totalBayar']}");
    print("---");
  }

  // Bonus: Demonstrasi closure yang mengakses variabel luar
  print("\nBONUS - CLOSURE DENGAN VARIABEL COUNTER:");

  Function createCounter() {
    int counter = 0;
    return () {
      counter++;
      return "Pemanggilan ke-$counter";
    };
  }

  var myCounter = createCounter();
  print(myCounter()); // Pemanggilan ke-1
  print(myCounter()); // Pemanggilan ke-2
  print(myCounter()); // Pemanggilan ke-3
}
