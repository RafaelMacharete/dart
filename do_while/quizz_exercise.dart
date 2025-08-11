import 'dart:io';

void main(){
  print('Choose a payment method: ');
  int? choice = 0;
  String paymentMethod;

  do {
    print("[1] - Pay in cash\n[2] - Pay in 2 installments (interest free)\n[3] - Pay in 3 installments (with 10% interest)");
    choice = int.parse(stdin.readLineSync()!);
  } while (choice < 1 || choice > 3);
  
  switch (choice) {
      case 1:
        paymentMethod = 'Cash';
        break;

      case 2:
        paymentMethod = '2x';
        break;
        
      case 3:
        paymentMethod = '3x';
        break;
        
      default:
        paymentMethod = 'none';
        print('insert a valid value!');
  } 
  print('payment method: $paymentMethod');
}