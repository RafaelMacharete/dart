import 'dart:io';

void main(){
  stdout.write("Enter your age: ");
  int? userAge = int.parse(stdin.readLineSync()!); 
  
  // if (True)...
  if (isAdult(userAge)){
    print('You are an adult!!');
  }else{
    print('You are not an adult :(');
  }
}

bool isAdult(int userAge){
  // If user age is greater or equals to 18, return true, else, false.
  return true ? userAge >= 18 : false; 
}