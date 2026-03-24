import 'dart:async';

Future<List<String>> sortListAsync(List<String> list) async {
  // Simulating an asynchronous sorting process
  await Future.delayed(Duration(seconds: 1));
  list.sort();
  return list;
}

void main() async {
  List<String> fruits = ["Banana", "Apple", "Mango", "Grapes", "Orange"];
  print("Original list: $fruits");

  print("Sorting list asynchronously...");
  List<String> sortedList = await sortListAsync(fruits);

  print("Sorted list: $sortedList");
}
