import 'dart:io';

void main(){
  // Basis variables.
  double? productPrice;
  double? discountPercentage;
  
  stdout.write('Enter the product price: ');
  productPrice = double.parse(stdin.readLineSync()!);

  stdout.write('Enter the discount percentage (e.g., 50): ');
  discountPercentage = double.parse(stdin.readLineSync()!);

  // get the result of calculateDiscount with 2 params (user inputs).
  double finalCost = calculateDiscount(productPrice, discountPercentage);

  print('Amount to be paid: ${finalCost.toStringAsFixed(2)}');
}

double calculateDiscount(double productPrice, double discountPercentage){
  double discountValue = productPrice * (discountPercentage / 100);
  return productPrice - discountValue;
}