abstract class Bottle {
  void open();

  factory Bottle() {
    return CokeBottle();
  }
}

class CokeBottle implements Bottle {
  @override
  void open() {
    print("Coke bottle is opened");
  }
}

void main() {
  // Instantiate CokeBottle using the factory constructor of Bottle
  Bottle myBottle = Bottle();
  myBottle.open();
}
