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
       body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // posisi di bawah
            children: [
              const FlutterLogo(
                size: 100,
                style: FlutterLogoStyle.horizontal,
                textColor: Colors.black,
              ),
              
              const Icon(
                Icons.home,
                size: 50,
                color: Colors.white,
              ),

              ElevatedButton(
                onPressed: () {
                  print("Button ditekan!");
                },
                child: const Text("Click Me"),
              ),

              TextButton(
                onPressed: () {
                  print("Text Button ditekan!");
                },
                child: const Text(
                  "PENCET GA!!",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              OutlinedButton(
                onPressed: () {
                  print("Outlined Button ditekan!");
                },
                child: const Text(
                  "OUTLINED BUTTON",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              IconButton(
                icon: Icon(Icons.thumb_up, color: Colors.white),
                onPressed: () {
                  print("Icon Button ditekan!");
                },
              ),

              FloatingActionButton(
                onPressed: () {
                  print("Floating Action Button ditekan!");
                },
                child: Icon(Icons.add),
              ),
            ],
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
