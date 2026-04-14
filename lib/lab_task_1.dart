enum Allergen {
  eggs(1),
  peanuts(2),
  shellfish(4),
  strawberries(8),
  tomatoes(16),
  chocolate(32),
  pollen(64),
  cats(128);

  final int score;
  const Allergen(this.score);
}

class Allergies {
  final int score;

  Allergies(this.score);

  bool isAllergicTo(Allergen allergen) {
    return (score & allergen.score) != 0;
  }

  List<String> list() {
    return Allergen.values
        .where((allergen) => isAllergicTo(allergen))
        .map((allergen) => allergen.name)
        .toList();
  }
}

void main() {
  int tomScore = 34;
  Allergies tomAllergies = Allergies(tomScore);

  print("Tom's score: $tomScore");
  print("Is Tom allergic to peanuts? ${tomAllergies.isAllergicTo(Allergen.peanuts)}");
  print("Is Tom allergic to chocolate? ${tomAllergies.isAllergicTo(Allergen.chocolate)}");
  print("Is Tom allergic to eggs? ${tomAllergies.isAllergicTo(Allergen.eggs)}");
  print("Tom's full list of allergies: ${tomAllergies.list()}");

  int complexScore = 257;
  Allergies complexAllergies = Allergies(complexScore);
  print("\nComplex score: $complexScore");
  print("Allergies (ignoring > 128): ${complexAllergies.list()}");
}
