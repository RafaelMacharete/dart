import 'dart:io';

class Human{
  String name = '';
  int age = 0;

  Human(this.age, this.name);

  void changeName(String newName){
    name = newName;
  }
}

void main(){
  Human person1 = Human(30, "Alice");
  Human person2 = Human(25, "Bob");
  Human person3 = Human(28, "Charlie");

  print("Name: ${person1.name}");
  print("Age: ${person1.age}");

  print("Name: ${person2.name}");
  print("Age: ${person2.age}");

  print("Name: ${person3.name}");
  print("Age: ${person3.age}");
  
  person3.changeName("David");
  print("Name: ${person3.name}");
}