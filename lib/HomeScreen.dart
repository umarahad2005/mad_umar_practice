import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  Widget build(BuildContext context ){
    return Scaffold(
      appBar: AppBar(title: const Text('mad lab with umar : Navigation'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/list'),
              child: const Text("Go to List View"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/grid'),
              child: const Text("Go to Grid View"),
            ),

          ],
        ),
      ),

    );
  }
}

