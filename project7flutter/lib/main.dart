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

// void main() {
//   runApp(ProfileLayout());
// }

// class ProfileLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Profile Layout'),
//         ),
//        body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 50, backgroundImage: AssetImage(  'assets/images/foto.png'),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Atsilah Amany Putri Harsuma',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 5),
//           Text('Flutter Developer', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
//         ],
//        ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(ListViewExample());
// }

// class ListViewExample extends StatelessWidget {
//   final List<String> items = [
//     'Flutter',
//     'Dart',
//     'Firebase',
//     'UI/UX',
//     'API'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('ListView Example'),
//         ),
//         body: ListView.builder(
//          itemCount: items.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               leading: Icon(Icons.code),
//               title: Text(items[index]),
//               onTap: () => print('Klik: ${items[index]}'),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(GridExample());
// }

// class GridExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Grid Example')),
//       body: GridView.count(
//         crossAxisCount: 2,
//         children: List.generate(6, (index) {
//           return Card(
//             color: Colors.blue[100],
//             margin: EdgeInsets.all(8),
//             child: Center(
//               child: Text(
//                 'Item ${index + 1}',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(StylingExample());
// }

// class StylingExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Styling and Positioning'),
//         ),
//         body: Stack(
//           children: [
//             Container(color: Colors.lightBlueAccent),
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 color: Colors.blue,
//                 child: Text(
//                   'Tengah Layar',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )
//       ),
//     );
//   }
// }

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/profile': (context) => ProfilePage(),
    },
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/profile'),
            child: Text('Ke Halaman Profil'),  
          )
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Profil'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Kembali ke Home Page'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
    );
  }
}