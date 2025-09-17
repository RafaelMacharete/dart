import 'dart:io';

class Animal{
    String size;
    String name;

    Animal(this.size, this.name);

    void move(){
      print('$this.name is moving')
    }
}

class AquaticAnimal extends Animal{
  AquaticAnimal(String size, String name): super(size, name);
  
    @override
    void move(){
      print('$this.name is swimming');
    }
}

class LandAnimal extends Animal{
  LandAnimal(String size, String name): super(size, name);

  @override
  void move(){
    print('$this.name is walkind')
  }
}

class AerialAnimal extends Animal{
  Aerial(String size, String name): super(size, name);

  @override
  void move(){
    print('$this.name is flying');
  }
}

void main(){
  List<Animal> animalList = [];

  print('........Welcome to ZOOMANGE........');
  int userChoice;
  while (true){
    print('[1] - Register new animal.')
    print('[2] - Retrieve all animals.')
    print('[3] - Edit data of an animal.')
    print('[4] - Remove an animal.')
    print('[5] - Retrive and filter animals.')
    print('[6] - Exit.')

    print('\nEnter a choice: ')
    userChoice = stdin.readLineSync();
    switch(userChoice){
      case 1:
        registerAnimal();
      case 2:
        retriveAllAnimals();
      case 3:
        editAnimal();
      case 4:
        removeAnimal();
      case 5:
        retrieveAndFilterAnimals();
      case 6:
        break;
      default:
        print('Enter a valid choice.');
    }
  }
}