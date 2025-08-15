import 'dart:io';

void main() {
  String? purchaseValue;

  while (true) {
    if (purchaseValue == null || purchaseValue.trim().isEmpty) {
      stdout.write("Enter a valid value: ");
      purchaseValue = stdin.readLineSync();
    } 
    try {
      stdout.write("Enter a the purchase value: ");
      purchaseValue = stdin.readLineSync();
    } on FormatException {
      stdout.write("Enter a valid value: ");
    } finally{
      double purchaseValueToDouble = double.parse(purchaseValue!);
    }
  }

}
