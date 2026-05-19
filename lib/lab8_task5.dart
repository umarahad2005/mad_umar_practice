import 'package:flutter/material.dart';
class ExplicitOpacityExample extends StatefulWidget {
  const ExplicitOpacityExample({super.key});

  @override
  State<ExplicitOpacityExample> createState() => _ExplicitOpacityExampleState();
}

// We add 'SingleTickerProviderStateMixin' to handle the animation timing
class _ExplicitOpacityExampleState extends State<ExplicitOpacityExample>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // 1. Initialize the controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // 2. Tell it to repeat (reverse: true makes it fade back in)
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose controllers to save memory!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Explicit Animation Loop")),
      body: Center(
        // 3. Use FadeTransition which takes the controller directly
        child: FadeTransition(
          opacity: _controller,
          child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAkqqsvnGAKjqmwjXwxSX6QAgwBTw0COrhLA&s'),
        ),
      ),
    );
  }
}