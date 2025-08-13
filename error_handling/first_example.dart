import 'dart:io';

void main() {
  print("Enter your name");
  String? username = stdin.readLineSync();

  if (username == null || username.trim().isEmpty) {
    print("Null data");
  } else {
    print("Ok $username");
  }

  try {
    print("Enter your age");
    int age = int.parse(stdin.readLineSync()!);
  } on FormatException {
    print("Enter just numbers");
  } on RangeError {
    print("Range error");
  } catch (e) {
    print('Unknown error: $e');
  }finally{
    print("Shuting program");
  }
}
