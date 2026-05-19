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
      home: AnimatedAlignPaddingPositionedExample(),
    );
  }
}
class AnimatedAlignPaddingPositionedExample extends StatefulWidget {
  @override
  _AnimatedAlignPaddingPositionedExampleState createState() =>
      _AnimatedAlignPaddingPositionedExampleState();
}
class _AnimatedAlignPaddingPositionedExampleState
    extends State<AnimatedAlignPaddingPositionedExample> {
  Alignment _alignment = Alignment.topLeft;
  EdgeInsets _padding = EdgeInsets.all(10);
  double _position = 50;
  void _animateProperties() {
    setState(() {
      _alignment = _alignment == Alignment.topLeft ? Alignment.bottomRight : Alignment.topLeft;
      _padding = _padding == EdgeInsets.all(10) ? EdgeInsets.all(50) : EdgeInsets.all(10);
      _position = _position == 50 ? 150 : 50;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedAlign, AnimatedPadding, and AnimatedPositioned Example")),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: _alignment,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: Container(width: 50, height: 50, color: Colors.blue),
          ),
          Center(
            child: AnimatedPadding(
              padding: _padding,
              duration: Duration(seconds: 1),
              child: Container(width: 100, height: 100, color: Colors.green),
            ),
          ),
          AnimatedPositioned(
            left: _position,
            top: _position,
            duration: Duration(seconds: 1),
            child: Container(width: 50, height: 50, color: Colors.red),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateProperties,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
