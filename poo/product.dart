import 'dart:io';

class Vehicle {
  String name;
  int capacity;
  int wheels;
  String? color;

  Vehicle({
    required this.name,
    required this.capacity,
    required this.wheels,
    this.color,
  });
}

class Car extends Vehicle {
  Car({
    required String name,
    required int capacity,
    String? color,
  }) : super(name: name, capacity: capacity, wheels: 4, color: color);
}

class Motorcycle extends Vehicle {
  bool? hasBau; 
  
  Motorcycle({
    required String name,
    required int capacity,
    String? color,
    this.hasBau
  }) : super(name: name, capacity: capacity, wheels: 2, color: color);
}

void main() {
  var car = Car(name: 'Toyota', capacity: 5, color: 'Red');
  var motorcycle = Motorcycle(name: 'Harley', capacity: 2, hasBau: true);

  print('Car: ${car.name}, Capacity: ${car.capacity}, Wheels: ${car.wheels}, Color: ${car.color}');
  print('Motorcycle: ${motorcycle.name}, Capacity: ${motorcycle.capacity}, Wheels: ${motorcycle.wheels}, Has Bau: ${motorcycle.hasBau}');

}
