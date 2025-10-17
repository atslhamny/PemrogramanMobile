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

// void main() {
//   runApp(ColumnExample());
// }

// class ColumnExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Column Example'),
//           backgroundColor: Colors.teal,
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'ini baris pertama',
//             ),
//             Text(
//               'ini baris kedua',
//             ),
//            ElevatedButton(
//               onPressed: () {},
//               child: Text('TOMBOL INI'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(StackExample());
// }

// class StackExample extends StatelessWidget {
//   const StackExample({super.key}); // Tambahkan konstruktor dengan super.key

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Stack Example'),
//         ),
//         body: Center(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 width: 200,
//                 height: 200,
//                 color: Colors.blue,
//               ),
//               Container(
//                 width: 150,
//                 height: 150,
//                 color: Colors.red,
//               ),
//               Text(
//                 'Tumpang Tindih',
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//              )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(ProfileLayout());
}

class ProfileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Layout'),
        ),
       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50, backgroundImage: AssetImage(  'assets/images/foto.png'),
          ),
          SizedBox(height: 10),
          Text(
            'Atsilah Amany Putri Harsuma',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text('Flutter Developer', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
        ],
       ),
      ),
    );
  }
}