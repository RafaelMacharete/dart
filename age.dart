import 'dart:io';

void main(){
  String? input = stdin.readLineSync();
  int age = int.parse(input!);
  int futureAge = age + 1;
  print('$age, $futureAge');  
}