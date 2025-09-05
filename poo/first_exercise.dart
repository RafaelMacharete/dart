import 'dart:io';

class Animal {
  String name;
  int age;

  Animal({
    required this.name, 
    required this.age
    });
}

class Dog extends Animal {
  String? breed;

  Dog({required String name, required int age, this.breed})
    : super(name: name, age: age);

  void makeSound() {
    print('Au au! (Woof Woof)');
  }
}

class Cat extends Animal {
  String? color;

  Cat({required String name, required int age, this.color})
    : super(name: name, age: age);

  void makeSound() {
    print('Miau! (Meow)');
  }
}

void main(){
  Dog dog = Dog(name: 'Rex', age: 3, breed: 'German Shepherd');
  Cat cat = Cat(name: 'Strawberry', age: 2, color: 'Red');

  dog.makeSound();
  cat.makeSound();
  print('Dog\'s Name: ${dog.name}, Age: ${dog.age}, Breed: ${dog.breed}');
  print('Cat\'s Name: ${cat.name}, Age: ${cat.age}, Color: ${cat.color}');
}
