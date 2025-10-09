import 'package:flutter/material.dart';

void main() {
  runApp(AtsilahApp());
}

class AtsilahApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Atsilah App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Atsilah App", style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Times New Roman',
            ), 
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Welcome to Atsilah App",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontFamily: 'Times New Roman',
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.network(
                'https://example.com/atsilah_image.png',
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
