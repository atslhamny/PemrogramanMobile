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
        body: 
        Container(
          width: 200,
          height: 100,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Hello, Atsilah!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Icon(Icons.home, size: 50, color: Colors.blue),
        //     Icon(Icons.business, size: 50, color: Colors.blue),
        //     Icon(Icons.school, size: 50, color: Colors.blue),
        //   ],
        // ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  // Navigate to Home
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Navigate to Settings
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('Contact Us'),
                onTap: () {
                  // Navigate to Contact Us
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            
          ],
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }
}
