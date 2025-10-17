import 'package:flutter/material.dart';

// void main() {
//   runApp(SingleChildExample());
// }

// class SingleChildExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Single Child Example'),
//           backgroundColor: Colors.teal,
//         ),
//         body: Center(
//           child: Text(
//             'Hello, Flutter!',
//             style: TextStyle(fontSize: 24, color: Colors.teal),
//           ),
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(ColumnExample());
}

class ColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Column Example'),
          backgroundColor: Colors.teal,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ini baris pertama',
            ),
            Text(
              'ini baris kedua',
            ),
           ElevatedButton(
              onPressed: () {},
              child: Text('TOMBOL INI'),
            ),
          ],
        ),
      ),
    );
  }
}