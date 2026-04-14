import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4 - Task 3',
      home: const DrawerScreen(),
    );
  }
}

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              color: Colors.deepPurple,
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                        'data:image/jpeg;base64,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 '),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'umar ahad ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text('Pro',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 8),
                      const Text('Seller',
                          style: TextStyle(
                              color: Colors.white70, fontSize: 13)),
                      const SizedBox(width: 8),
                      const Text('4.8',
                          style: TextStyle(
                              color: Colors.white, fontSize: 13)),
                      const Icon(Icons.star_border,
                          color: Colors.white, size: 16),
                    ],
                  ),
                ],
              ),
            ),

            // Nav Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _drawerItem(Icons.home, 'Home', isSelected: true),
                  _drawerItem(Icons.face, 'Woman'),
                  _drawerItem(Icons.sentiment_satisfied, 'Man'),
                  _drawerItem(Icons.child_care, 'Kids'),
                  _drawerItem(Icons.apps, 'New Collection'),
                  _drawerItem(Icons.grid_view, 'Components'),
                  _drawerItem(Icons.account_circle, 'Profile'),
                  _drawerItem(Icons.settings, 'Settings'),
                  _drawerItem(Icons.login, 'Sign In'),
                  _drawerItem(Icons.app_registration, 'Sign Up'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Swipe from left or tap ☰ to open Drawer'),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title,
      {bool isSelected = false}) {
    return Container(
      color: isSelected ? Colors.deepPurple : Colors.transparent,
      child: ListTile(
        leading: Icon(icon,
            color: isSelected ? Colors.white : Colors.black87),
        title: Text(title,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected
                    ? FontWeight.bold
                    : FontWeight.normal)),
        onTap: () {},
      ),
    );
  }
}