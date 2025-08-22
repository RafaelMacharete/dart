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

  // Cpf regex.

  // User data.
  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();
  // Handling invalid entrace.
  while (name == null || name.trim().isEmpty) {
    stdout.write('Enter a valid name: ');
    name = stdin.readLineSync();
  }

  // Handling invalid entrace.
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

  // User entrace:
  initiatePurchase(product_and_service_list);
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

double calculatePurchaseValue(int productQuantity, double productPrice) {
  int paymentMethodChoosed;

  double purchasePrice = productPrice * productQuantity;

  do {
    stdout.write(
      'Choose a payment method: \n[0] - Cash (10% discount)\n[1] - Debit (5% discount)\n[2] - Credit (5% interest)\n[3] - PIX (10% discount)',
    );
    paymentMethodChoosed = int.parse(stdin.readLineSync()!);
    switch (paymentMethodChoosed) {
      case 0:
        double valuePaid = double.parse(stdin.readLineSync()!);
        stdout.write('Enter the value paid: ');
        // Lower value paid
        while (valuePaid < purchasePrice) {
          print("Is remaining: ${purchasePrice - valuePaid}");
        }
        if (valuePaid > purchasePrice) {
          print("Your change is: ${valuePaid - purchasePrice}");
        }
        double discount = purchasePrice * 0.10;
        purchasePrice -= discount;
        break;
      case 1:
        double discount = purchasePrice * 0.05;
        purchasePrice -= discount;
        break;
      case 2:
        double interest = purchasePrice * 0.05;
        purchasePrice += interest;
        break;
      case 3:
        double discount = purchasePrice * 0.10;
        purchasePrice -= discount;
        break;
      default:
        print('Invalid payment method');
    }
  } while (paymentMethodChoosed < 0 || paymentMethodChoosed > 3);

  return purchasePrice;
}

bool isValid(String input) {
  final regex = RegExp(r'^[0-9eE]+$');
  return regex.hasMatch(input);
}

dynamic initiatePurchase(productsAndServicesList) {
  String? userProductChoice;
  String? userProductQuantity;
  dynamic userCart = [];

    // User product choice.
    do {
      listProductsAndServices(productsAndServicesList);
      stdout.write('\nChoose a product (e/E to exit): ');
      userProductChoice = stdin.readLineSync();
      while (userProductChoice == null || userProductChoice.trim().isEmpty 
        || !isValid(userProductChoice)) 
      {
        stdout.write('Enter a valid choice (e/E to exit): ');
        userProductChoice = stdin.readLineSync();
      }
      if (userProductChoice == 'e' || userProductChoice == 'E') {
        break;
      }
      
      bool isQuantityValid = false;

      // Adding product and quantity to the cart.
      do {
        // In case of a service, is not need to insert the quantity.
        if (productsAndServicesList['stock'][int.parse(userProductChoice)] ==
            null) {
          print('This is a service, you do not need to choose a quantity.');
          isQuantityValid = true;
          double productPrice =
              productsAndServicesList['price'][int.parse(userProductChoice)];
          userCart.add({
            'product': productsAndServicesList['title'][int.parse(userProductChoice)],
            'quantity': 1,
            'price': productPrice,
          });

        } else {
          stdout.write('Enter a quantity: ');
          userProductQuantity = stdin.readLineSync();
          while(userProductQuantity == null || userProductQuantity.trim().isEmpty ||
            int.parse(userProductQuantity) <= 0 )
          {
            stdout.write('Enter a valid quantity: ');
            userProductQuantity = stdin.readLineSync();
          }
          int userProductQuantityInNumber = int.parse(userProductQuantity);

          if (userProductQuantityInNumber <=
              productsAndServicesList['stock'][int.parse(userProductChoice)]) {
            isQuantityValid = true;
            double productPrice =
                productsAndServicesList['price'][int.parse(userProductChoice)];
              userCart.add({
                'product': productsAndServicesList['title'][int.parse(userProductChoice)],
                'quantity': userProductQuantity,
                'price': productPrice,
              });
          } else {
            print('Invalid quantity');
            isQuantityValid = false;
          }
        }
      } while (isQuantityValid == false);
    } while (userProductChoice != 'e' && userProductChoice != 'E');
    print(userCart);
}
