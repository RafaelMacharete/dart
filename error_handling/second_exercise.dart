import 'dart:io';

void main() {
  double? purchaseValueAsDouble;

  while (purchaseValueAsDouble == null) {
    stdout.write('Enter the purchase value: ');
    String? purchaseValue = stdin.readLineSync();

    try {
      purchaseValueAsDouble = double.parse(purchaseValue ?? '');
    } on FormatException {
      print('Invalid format.');
    }
  }

  int? paymentMethodAsInt;

  while (paymentMethodAsInt == null ) {
    print('[1] - In cash\n[2] - Debit card\n[3] - Credit card\n[4] - Pix');
    stdout.write('Enter a payment method: ');
    String? paymentMethod = stdin.readLineSync();

    try {
      paymentMethodAsInt = int.parse(paymentMethod ?? '');
      if (paymentMethodAsInt < 1 || paymentMethodAsInt > 4) {
        print('Invalid payment method.');
        paymentMethodAsInt = null;
      }
    } on FormatException {
      print('Invalid format.');
    }
  }

  switch (paymentMethodAsInt) {
    case 1:
      print('You choosed pix');
      break;
    case 2:
      print('You choosed debit card');
      break;
    case 3:
      print('You choosed credit card');
      break;
    case 4:
      print('You choosed pix');
      break;
    default:
  }

}
