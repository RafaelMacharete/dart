import 'dart:io';

void main(){
    stdout.write("Enter your name: ");
    String? fullName = stdin.readLineSync();
    
    while(true){
        if (fullName == null || fullName.trim().isEmpty) {
            stdout.write("Enter a valid value: ");
            fullName = stdin.readLineSync();
        }else{
            break;
        }
    }
}