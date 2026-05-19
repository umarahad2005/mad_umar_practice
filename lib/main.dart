/*import 'package:flutter/material.dart';
import 'lab8_task1.dart';
import 'lab8_task2.dart';
import 'lab8_task3.dart';
import 'lab8_task4.dart';
import 'lab8_task5.dart';// Added missing semicolon

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Container Demo',
      // Removed the semicolon inside the return statement
      home: ExplicitOpacityExample(),
    ); // Added the missing closing parenthesis for MaterialApp
  }
}
*/

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();   // ← no options needed if google-services.json is correct
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}