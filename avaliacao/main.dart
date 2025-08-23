import 'dart:io';

void main() {
  // Products and services list, refererenced by each index,
  // e.g., Banana: 5.50$, in stock: 14 and type: product.
  dynamic product_and_service_list = {
    'title': ['Banana', 'Delivery', 'Potato', 'Apple'],
    'price': [5.50, 3.0, 3.65, 6.73],
    'stock': [14, null, 17, 33],
    'type': ['product', 'service', 'product', 'product'],
  };

  // User data.
  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();
  // Handling invalid entrance.
  while (name == null || name.trim().isEmpty) {
    stdout.write('Enter a valid name: ');
    name = stdin.readLineSync();
  }

  // Handling invalid entrance.
  // Cpf regex (xxx.xxx.xxx-xx)
  final exp = RegExp(
    r'^\d{3}\.\d{3}\.\d{3}-\d{2}$',
  );

  stdout.write('Enter your cpf (e.g., xxx.xxx.xxx-xx): ');
  String? document = stdin.readLineSync();
  while (document == null ||
      document.trim().isEmpty ||
      !exp.hasMatch(document)) {
    stdout.write('Enter a valid cpf (e.g., xxx.xxx.xxx-xx): ');
    document = stdin.readLineSync();
  }

  // User entrance:
  dynamic userCart = initiatePurchase(product_and_service_list);
  print(userCart);
  double total = calculatePurchaseValue(userCart);
  print('Total purchase value: \$${total.toStringAsFixed(2)}');
}

dynamic listProductsAndServices(dynamic productsAndServicesList) {
  print('\n-----Available products/services-----');
  for (var idx = 0; idx < productsAndServicesList['title'].length; idx++) {
    print(
      '${[idx]} - ${productsAndServicesList["title"][idx]}: \x1B[32m\$${productsAndServicesList['price'][idx]}\x1B[0m, in stock: \x1B[31m${productsAndServicesList['stock'][idx]}\x1B[0m',
    );
  }
}

void showProductChoiced(int idx, productsAndServicesList) {
  print(
    '\x1b[36;47;1;4mYou choosed: ${productsAndServicesList['title'][idx]}\x1b[0m',
  );
}

double calculatePurchaseValue(dynamic userCart) {
  int? paymentMethodChoosed;
  double purchasePrice = 0.0;

  // Sum cart products
  for (var item in userCart) {
    purchasePrice += item['price'] * item['quantity'];
  }

  // Payment method selection
  do {
    stdout.write(
      '\nTotal: \$${purchasePrice.toStringAsFixed(2)}'
      '\nChoose a payment method:' 
      '\n[0] - Cash (10% discount)'
      '\n[1] - Debit (5% discount)'
      '\n[2] - Credit (5% interest)'
      '\n[3] - PIX (10% discount)'
      '\nYour choice: ',
    );

    String? input = stdin.readLineSync();
    try {
      paymentMethodChoosed = int.parse(input ?? '');
      if (paymentMethodChoosed < 0 || paymentMethodChoosed > 3) {
        print('Enter a valid option between 0 and 3.');
        paymentMethodChoosed = null;
      }
    } on FormatException {
      print('Invalid format. Enter only numbers.');
      paymentMethodChoosed = null;
    }
  } while (paymentMethodChoosed == null);

  // Aplica descontos/juros
  switch (paymentMethodChoosed) {
    case 0: // Dinheiro
      double? valuePaid;
      do {
        stdout.write('Enter the value paid: ');
        String? input = stdin.readLineSync();
        try {
          valuePaid = double.parse(input ?? '');
          if (valuePaid < purchasePrice) {
            print("Insufficient amount. Remaining: \$${(purchasePrice - valuePaid).toStringAsFixed(2)}");
            valuePaid = null;
          }
        } on FormatException {
          print('Invalid format. Enter a valid number.');
          valuePaid = null;
        }
      } while (valuePaid == null);

      double discount = purchasePrice * 0.10;
      purchasePrice -= discount;
      if (valuePaid > purchasePrice) {
        print("Your change is: \$${(valuePaid - purchasePrice).toStringAsFixed(2)}");
      }
      break;

    case 1: // Debit
      double discount = purchasePrice * 0.05;
      purchasePrice -= discount;
      break;

    case 2: // Credit
      double interest = purchasePrice * 0.05;
      purchasePrice += interest;
      break;

    case 3: // PIX
      double discount = purchasePrice * 0.10;
      purchasePrice -= discount;
      break;
  }

  return purchasePrice;
}

dynamic initiatePurchase(productsAndServicesList) {
  /*
    Initiate the purchase flow, allowing the user to select products/services
    and their quantities (with validations), and then proceed to payment.
  */
  String? userProductChoice;
  String? userProductQuantity;
  int? userProductChoiceAsNumber;
  int? userProductQuantityAsNumber;
  bool isQuantityValid;

  dynamic userCart = [];

  // User product choice.
  do {
    listProductsAndServices(productsAndServicesList);

    // Reset vars in each iteration.
    userProductChoiceAsNumber = null;
    userProductQuantityAsNumber = null;
    isQuantityValid = false;

    // Product choice.
    while (userProductChoiceAsNumber == null) {
      stdout.write('\nChoose a product (e/E to exit): ');
      userProductChoice = stdin.readLineSync();
      if (userProductChoice == 'e' || userProductChoice == 'E') {
        return userCart; // Returns the current cart.
      }
      try {
        userProductChoiceAsNumber = int.parse(userProductChoice ?? '');
        if (userProductChoiceAsNumber < 0 ||
            userProductChoiceAsNumber >= productsAndServicesList['title'].length) {
          userProductChoiceAsNumber = null;
          print('Enter an option between 0 and ${productsAndServicesList['title'].length - 1}');
        }
      } on FormatException {
        print('Invalid format. Enter only valid numbers.');
      }
    }

    // Validate the quantity.
    while (!isQuantityValid) {
      if (productsAndServicesList['stock'][userProductChoiceAsNumber] == null) {
        // Service case.
        isQuantityValid = true;
        print('This is a service, you do not need to choose a quantity.');
        double productPrice =
            productsAndServicesList['price'][userProductChoiceAsNumber];
        userCart.add({
          'product': productsAndServicesList['title'][userProductChoiceAsNumber],
          'quantity': 1,
          'price': productPrice,
        });
      } else {
        // Product case.
        while (userProductQuantityAsNumber == null || userProductQuantityAsNumber <= 0) {
          stdout.write('Enter a integer quantity: ');
          userProductQuantity = stdin.readLineSync();
          try {
            userProductQuantityAsNumber = int.parse(userProductQuantity ?? '');
          } on FormatException {
            print('Invalid format. Enter only integer numbers');
            userProductQuantityAsNumber = null;
          }
        }

        if (userProductQuantityAsNumber <=
            productsAndServicesList['stock'][userProductChoiceAsNumber]) {
          isQuantityValid = true;
          double productPrice =
              productsAndServicesList['price'][userProductChoiceAsNumber];
          userCart.add({
            'product': productsAndServicesList['title'][userProductChoiceAsNumber],
            'quantity': userProductQuantityAsNumber,
            'price': productPrice,
          });
        } else {
          print('Invalid quantity, greater than stock.');
          isQuantityValid = false;
          break;
        }
      }
    }
  } while (true);

}