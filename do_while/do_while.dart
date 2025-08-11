import 'dart:io';

void main(){
  int number = 0;
  int count = 0;

  do {
    print('Hello!');
  } while (number > 1);

  while (count < 5) {
    print('Count: $count');
    count++;  
  }

  print('Enter your password: ');
  String? password = stdin.readLineSync();

  while (password != '123') {
    print('Invalid credentials, enter again: ');
    password = stdin.readLineSync();
  }

  print('Your cep is: 13xxx-xxx');
  print('Your email is: rafaelmxxxxx@gmail.com');

  
}