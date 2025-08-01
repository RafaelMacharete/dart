import 'dart:io';

void main() {
  /*
    -_-_-_-_-_-_-_-_-_-_-_-_
    Exercise 1
    -_-_-_-_-_-_-_-_-_-_-_-_
  */
  List<int> notes = [5, 5, 5, 4, 5];
  double avarage = 0;

  for (var note in notes) {
    avarage += note;
  }
  avarage /= notes.length;
  print(avarage);
  if (avarage >= 5) {
    print('approved');
  } else if (avarage < 4) {
    print('reproved');
  } else {
    print('recovery');
  }

  /*
    -_-_-_-_-_-_-_-_-_-_-_-_
    Exercise 2
    -_-_-_-_-_-_-_-_-_-_-_-_
  */
  print('Enter your name: ');
  String? username = stdin.readLineSync();
  List<double> userSalary = [];

  // Get the 3 last salary of the user, and add into the userSalary collection.
  for (var i = 0; i < 3; i++) {
    print('Enter your ${i + 1}° last salary: ');
    userSalary.add(double.parse(stdin.readLineSync()!));

    // Error handling: user input is negative.
    if (userSalary[i] < 0) {
      print('Enter a positive salary');
      userSalary[i] = double.parse(stdin.readLineSync()!);
    }
  }
  print(userSalary);
  /* 
    Iterate over the userSalary collection and sum into a var and
    calculate the avarage of it.
  */
  double userSalaryAvarage = 0;
  for (var salary in userSalary) {
    userSalaryAvarage += salary;
  }
  userSalaryAvarage /= userSalary.length;

  print('$username, your salary avarage of the last 3 is: $userSalaryAvarage');
}
