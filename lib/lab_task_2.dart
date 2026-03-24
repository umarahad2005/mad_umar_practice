class Camera {
  int? _id;
  String? _brand;
  String? _color;
  double? _price;

  // Getters
  int? get id => _id;
  String? get brand => _brand;
  String? get color => _color;
  double? get price => _price;

  // Setters
  set id(int? value) => _id = value;
  set brand(String? value) => _brand = value;
  set color(String? value) => _color = value;
  set price(double? value) => _price = value;

  void display() {
    print("Camera ID: $_id, Brand: $_brand, Color: $_color, Price: $_price");
  }
}

void main() {
  Camera cam1 = Camera();
  cam1.id = 1;
  cam1.brand = "Canon";
  cam1.color = "Black";
  cam1.price = 500.0;

  Camera cam2 = Camera();
  cam2.id = 2;
  cam2.brand = "Nikon";
  cam2.color = "Silver";
  cam2.price = 600.0;

  Camera cam3 = Camera();
  cam3.id = 3;
  cam3.brand = "Sony";
  cam3.color = "Black";
  cam3.price = 750.0;

  cam1.display();
  cam2.display();
  cam3.display();
}
