import 'dart:async';
import 'dart:io';

Future<void> main() async {
  print("Enter first integer:");
  int num1 = int.parse(stdin.readLineSync()!);

  print("Enter second integer:");
  int num2 = int.parse(stdin.readLineSync()!);

  print("Waiting for 3 seconds...");
  await Future.delayed(Duration(seconds: 3));

  int sum = num1 + num2;
  print("The sum of $num1 and $num2 is: $sum");
}
