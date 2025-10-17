import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(AplikasiSaya());
}

class AplikasiSaya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile & Counter App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: HalamanUtama(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _menuTerpilih = 0;

  final List<Widget> _halaman = [
    HalamanProfil(),
    HalamanCounter(),
  ];

  void _ubahHalaman(int index) {
    setState(() {
      _menuTerpilih = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _halaman[_menuTerpilih],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _menuTerpilih,
        selectedItemColor: Colors.teal,
        onTap: _ubahHalaman,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Counter'),
        ],
      ),
    );
  }
}

// ---------------- Halaman Profil ----------------
class HalamanProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.teal[50],
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          // <-- Tambahkan ini
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 80),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundImage: Image(image:   AssetImage('assets/images/foto.png')).image,
              ),
              const SizedBox(height: 20),
              Text(
                'Atsilah Amany Putri Harsuma',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Text('NIM: 2341760011'),
              const Text('Jurusan: Teknologi Informasi'),
              const Text('Prodi : Sistem Informasi Bisnis'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.email, color: Colors.teal),
                  SizedBox(width: 8),
                  Text('atsilahamanyph@gmail.com'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.phone, color: Colors.teal),
                  SizedBox(width: 8),
                  Text('+62 8135-9345-579'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- Halaman Counter ----------------
class HalamanCounter extends StatefulWidget {
  @override
  _HalamanCounterState createState() => _HalamanCounterState();
}

class _HalamanCounterState extends State<HalamanCounter> {
  int angka = 0;

  void tambah() {
    setState(() {
      angka++;
    });
  }

  void kurang() {
    setState(() {
      angka--;
    });
  }

  void reset() {
    setState(() {
      angka = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Angka Saat Ini:',
                style: GoogleFonts.poppins(fontSize: 18)),
            Text('$angka',
                style: GoogleFonts.poppins(
                    fontSize: 50, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: tambah, child: const Text('+')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: kurang, child: const Text('-')),
                const SizedBox(width: 10),
                OutlinedButton(onPressed: reset, child: const Text('Reset')),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: tambah,
        child: const Icon(Icons.add),
      ),
    );
  }
}
