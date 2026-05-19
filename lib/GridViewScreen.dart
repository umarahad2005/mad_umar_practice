import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: GridViewScreen()));
}

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  // 1. Unified Exit Logic (Used by Swipe, Long Press, and System Back)
  Future<void> _handleExit(BuildContext context) async {
    final bool? shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit Confirmation"),
        content: const Text("Do you really want to go back?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Yes"),
          ),
        ],
      ),
    );

    // If 'Yes' was clicked, we pop the actual screen
    if (shouldExit == true && context.mounted) {
      Navigator.of(context).pop();
    }
  }

  // 2. Bottom Sheet Logic
  void _showBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 200,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Item $index Description",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Divider(),
            const Text("This description appeared because you tapped the grid item."),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent automatic exit
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        _handleExit(context); // Trigger dialog on system back gesture
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gesture Master Grid"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                // TRIGGER: Tap -> Bottom Sheet
                onTap: () => _showBottomSheet(context, index),

                // TRIGGER: Long Press -> Alert Dialog
                onLongPress: () => _handleExit(context),

                // TRIGGER: Double Tap -> SnackBar
                onDoubleTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Quick Action: Item $index selected!"),
                      duration: const Duration(milliseconds: 500),
                    ),
                  );
                },

                // TRIGGER: Right Sweep -> Exit Alert
                onHorizontalDragUpdate: (details) {
                  if (details.delta.dx > 20) { // Right swipe detected
                    Navigator.maybePop(context);
                  }
                },

                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1 * ((index % 8) + 1)),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.blueAccent.withOpacity(0.5)),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          "Item $index",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      // TRIGGER: Popup Menu Button
                      Positioned(
                        top: 5,
                        right: 5,
                        child: PopupMenuButton<String>(
                          onSelected: (value) {
                            debugPrint("Selected: $value");
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(value: "info", child: Text("Get Info")),
                            const PopupMenuItem(value: "share", child: Text("Share")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      )
    );
  }
}
