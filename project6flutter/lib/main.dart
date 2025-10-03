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
          title: Text(
            "Atsilah App",
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          leading: Icon(Icons.menu),
          actions: [
            Icon(Icons.search),
            // Icons(Icons.more_vert),
          ],
        ),
        body: const Center(
          child: Text(
            "Hello, Atsilah!",
            style: TextStyle(fontSize: 24),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action when button is pressed
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
