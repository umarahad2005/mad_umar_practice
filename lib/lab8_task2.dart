import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Container Demo',
      home: AnimatedOpacityExample(),
    );
  }
}


class AnimatedOpacityExample extends StatefulWidget {
  @override
  _AnimatedOpacityExampleState createState() => _AnimatedOpacityExampleState();
}
class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  double _opacity = 1.0;
  void _toggleOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedOpacity Example")),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 1),
          child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAkqqsvnGAKjqmwjXwxSX6QAgwBTw0COrhLA&s'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleOpacity,
        child: Icon(Icons.visibility),
      ),
    );
  }
}