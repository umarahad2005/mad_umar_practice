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
      home: AnimatedContainerExample(),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;

  void _changeProperties() {
    setState(() {
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("AnimatedContainer Example")
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          color: _color,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeProperties,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
class AnimatedSwitcherExample extends StatefulWidget {
  @override
  _AnimatedSwitcherExampleState createState() => _AnimatedSwitcherExampleState();
}
class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool _showFirst = true;
  void _switchWidget() {
    setState(() {

      _showFirst = !_showFirst;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedSwitcher Example")),
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: _showFirst
              ? Container(
            key: ValueKey(1),
            color: Colors.blue,
            width: 100,
            height: 100,
            alignment: Alignment.center,
            child: Text(
              "First",
              style: TextStyle(color: Colors.white),
            ),
          )
              : Container(
            key: ValueKey(2),
            color: Colors.red,
            width: 100,
            height: 100,
            alignment: Alignment.center,
            child: Text(
              "Second",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _switchWidget,
        child: Icon(Icons.switch_left),
      ),
    );
  }
}