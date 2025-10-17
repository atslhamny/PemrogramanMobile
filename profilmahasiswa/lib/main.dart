import 'package:flutter/material.dart';
import 'routes.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'gallery_page.dart';

void main() {
  runApp(AplikasiProfilGaleri());
}

class AplikasiProfilGaleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil & Galeri Mahasiswa',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profil': (context) => ProfilePage(),
        '/galeri': (context) => GalleryPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
