import 'dart:async';
import 'dart:io';

Future<String> reverseStringAsync(String input) async {
  // Simulating an asynchronous operation
  await Future.delayed(Duration(seconds: 1));
  return input.split('').reversed.join('');
}

void main() async {
  print("Enter a string to reverse:");
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    print("Reversing string asynchronously...");
    String reversed = await reverseStringAsync(input);
    print("Reversed string: $reversed");
  } else {
    print("Invalid input.");
  }
}
