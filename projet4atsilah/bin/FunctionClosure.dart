void main(){
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