import 'dart:io'; // Import the language functions

// All file needs a function void main
void main(){ // Main function
  print('Enter your name');
  String? name = stdin.readLineSync();
  print("Your name is: $name");

  if (name!.toLowerCase() == 'rafael') {
    print("You are Rafael!");
  } else {
    print("You are not Rafael");
  }

}