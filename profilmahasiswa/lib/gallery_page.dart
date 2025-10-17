import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<String> gambar = [
    'assets/images/foto.png',
    'assets/images/foto1.png',
    'assets/images/foto2.png',
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galeri Saya')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: gambar.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.teal[100],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(gambar[index], fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    );
  }
}
