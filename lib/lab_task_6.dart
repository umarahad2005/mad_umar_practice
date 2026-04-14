import 'dart:math';

// This function randomly returns 100 OR null
int? generateRandom() {
  Random random = Random();
  // nextBool() returns true or false randomly
  return random.nextBool() ? 100 : null;
}

void main() {
  // int (no ?) means status can NEVER be null
  // ?? 0 means: if generateRandom() returns null, use 0
  int status = generateRandom() ?? 0;

  print('Status: $status');
  // Output is either:  Status: 100
  //              or:  Status: 0

  // Run it multiple times to see both results
  for (int i = 1; i <= 5; i++) {
    int s = generateRandom() ?? 0;
    print('Run $i → $s');
  }
}