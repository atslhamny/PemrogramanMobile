import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final List<String> mataKuliah = [
    'Pemrograman Mobile',
    'Manajemen Rantai Pasok',
    'Manajemen Proyek SI',
    'ERP (Enterprise Resource Planning)',
    'Metodologi Penelitian',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Mahasiswa')),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.teal[50],
        child: ListView(
          children: [
            // Bagian atas: Row berisi foto dan teks
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/foto.png'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: Colors.teal, width: 2),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Atsilah Amany Putri Harsuma',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text('NIM: 2341760011'),
                    Text('Jurusan: Teknologi Informasi'),
                    Text('Prodi: Sistem Informasi Bisnis'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Daftar Mata Kuliah Semester 5:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // ListView untuk daftar mata kuliah
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: mataKuliah.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.book, color: Colors.teal),
                      title: Text(mataKuliah[index]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/galeri');
                },
                icon: const Icon(Icons.photo),
                label: const Text('Lihat Galeri Mahasiswa'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
